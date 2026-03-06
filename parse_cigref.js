const fs = require('fs');
const path = require('path');

const inputFile = path.join(__dirname, 'cigref2.sql');
const outputFile = path.join(__dirname, 'cigref_h2.sql');

const content = fs.readFileSync(inputFile, 'utf8');

let h2Content = `-- Auto-generated from cigref2.sql for H2\n\n`;

// Mapping tables
const tableMapping = {
    'famille': 'famille_si',
    'metier': 'metier_si',
    'activite': 'activite_si',
    'competence': 'competence_si',
    'metier_competence': 'metier_competence_si'
};

const lines = content.split('\n');

for (let line of lines) {
    let trimmed = line.trim();
    if (!trimmed || trimmed.startsWith('--') || trimmed.startsWith('SET NAMES') || trimmed.startsWith('SET FOREIGN_KEY_CHECKS')) {
        continue;
    }

    // Convert variables: SET @var := (SELECT ...) -> SET @var = (SELECT ...)
    if (trimmed.startsWith('SET @')) {
        line = line.replace(/SET @(\w+) :=/g, 'SET @$1 =');
        // Replace table names in subqueries
        for (const [mysqlTable, h2Table] of Object.entries(tableMapping)) {
            const regex = new RegExp(`\\b${mysqlTable}\\b`, 'g');
            line = line.replace(regex, h2Table);
        }
        h2Content += line + '\n';
        continue;
    }

    // Handle INSERT INTO
    if (trimmed.startsWith('INSERT INTO')) {
        // Replace table name
        for (const [mysqlTable, h2Table] of Object.entries(tableMapping)) {
            const regex = new RegExp(`INSERT INTO ${mysqlTable}\\b`, 'g');
            if (regex.test(line)) {
                line = line.replace(regex, `INSERT INTO ${h2Table}`);
                break;
            }
        }

        // Remove ON DUPLICATE KEY UPDATE ...
        line = line.replace(/ ON DUPLICATE KEY UPDATE.*?;/g, ';');

        // Final safety check if it didn't end with ;
        if (!line.trim().endsWith(';')) {
            line = line.replace(/ ON DUPLICATE KEY UPDATE.*/g, ';');
        }

        h2Content += line + '\n';
    }
}

fs.writeFileSync(outputFile, h2Content);
console.log(`Successfully converted to ${outputFile}`);
