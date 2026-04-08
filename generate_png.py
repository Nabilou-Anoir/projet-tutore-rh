import glob
import zlib
import base64
import urllib.request

for puml_file in glob.glob("*.puml"):
    print(f"Generating PNG for {puml_file}...")
    with open(puml_file, 'rb') as f:
        text = f.read()

    compressed = zlib.compress(text, 9)
    encoded = base64.urlsafe_b64encode(compressed).decode('utf-8')
    url = f"https://kroki.io/plantuml/png/{encoded}"

    png_file = puml_file.replace('.puml', '.png')
    
    try:
        req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0'})
        with urllib.request.urlopen(req) as response, open(png_file, 'wb') as out_file:
            out_file.write(response.read())
        print(f"Successfully created {png_file}")
    except Exception as e:
        print(f"Error generating {png_file}: {e}")
