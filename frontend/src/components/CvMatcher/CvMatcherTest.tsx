import React, { useState } from "react";
import { analyzeOffer, scoreCv } from "../../api/cvApi";

type Criteria = {
  role_title?: string;
  must_have?: string[];
  nice_to_have?: string[];
  keywords?: string[];
  raw_offer_text?: string;
};

type AnalysisResult = {
  total_score?: number;
  strengths?: string[];
  gaps?: string[];
  short_recommendation?: string;
  error?: string;
};

type RankedResult = {
  name: string;
  analysis: AnalysisResult;
};

const CvMatcherTest = () => {
  const [jobOfferText, setJobOfferText] = useState("");
  const [offerMode, setOfferMode] = useState<"text" | "file">("text");
  const [jobOfferFile, setJobOfferFile] = useState<File | null>(null);
  const [criteria, setCriteria] = useState<Criteria | null>(null);

  const [files, setFiles] = useState<File[]>([]);
  const [results, setResults] = useState<RankedResult[]>([]);

  const [loadingOffer, setLoadingOffer] = useState(false);
  const [scoringProgress, setScoringProgress] = useState<{
    current: number;
    total: number;
    fileName?: string;
  } | null>(null);

  const [error, setError] = useState<string | null>(null);

  const handleAnalyzeOffer = async () => {
    if (offerMode === "text" && !jobOfferText.trim()) {
      setError("Veuillez coller une offre.");
      return;
    }

    if (offerMode === "file" && !jobOfferFile) {
      setError("Veuillez importer un fichier d'offre.");
      return;
    }

    setLoadingOffer(true);
    setError(null);
    setCriteria(null);
    setResults([]);

    try {
      const formData = new FormData();
      formData.append("job_offer_text", offerMode === "text" ? jobOfferText : "");

      if (offerMode === "file" && jobOfferFile) {
        formData.append("job_offer_file", jobOfferFile);
      }

      const data = await analyzeOffer(formData);
      setCriteria(data);

      if (offerMode === "file" && jobOfferFile) {
        setJobOfferText(`[Offre importée : ${jobOfferFile.name}]`);
      }
    } catch (err) {
      console.error(err);
      setError("Erreur lors de l'analyse de l'offre.");
    } finally {
      setLoadingOffer(false);
    }
  };

  const handleFilesChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const selectedFiles = Array.from(e.target.files || []);
    setFiles(selectedFiles);
    setResults([]);
    setError(null);
  };

  const handleRunScoring = async () => {
    if (!criteria) {
      setError("Veuillez d'abord analyser une offre.");
      return;
    }

    if (files.length === 0) {
      setError("Veuillez sélectionner au moins un CV.");
      return;
    }

    setResults([]);
    setError(null);
    setScoringProgress({ current: 0, total: files.length });

    const tempResults: RankedResult[] = [];

    for (let i = 0; i < files.length; i++) {
      const currentFile = files[i];
      if (!currentFile) continue;

      setScoringProgress({
        current: i + 1,
        total: files.length,
        fileName: currentFile.name,
      });

      const formData = new FormData();
      formData.append("file", currentFile);
      formData.append("job_offer", criteria.raw_offer_text || jobOfferText);
      formData.append("criteria", JSON.stringify(criteria));

      try {
        const res = await scoreCv(formData);

        if (res?.error) {
          tempResults.push({
            name: currentFile.name,
            analysis: {
              total_score: 0,
              strengths: [],
              gaps: [res.error],
              short_recommendation: "Erreur lors de l'analyse du CV.",
              error: res.error,
            },
          });
        } else {
          tempResults.push({
            name: currentFile.name,
            analysis: res,
          });
        }
      } catch (err) {
        console.error(`Erreur sur ${currentFile.name}`, err);

        tempResults.push({
          name: currentFile.name,
          analysis: {
            total_score: 0,
            strengths: [],
            gaps: ["Requête API échouée ou backend indisponible."],
            short_recommendation: "Impossible d'analyser ce CV.",
            error: "API error",
          },
        });
      }

      const sortedLive = [...tempResults].sort(
        (a, b) => (b.analysis.total_score || 0) - (a.analysis.total_score || 0)
      );
      setResults(sortedLive);
    }

    const sorted = [...tempResults].sort(
      (a, b) => (b.analysis.total_score || 0) - (a.analysis.total_score || 0)
    );

    setResults(sorted);
    setScoringProgress(null);
  };

  const progressPercent = scoringProgress
    ? Math.round((scoringProgress.current / scoringProgress.total) * 100)
    : 0;

  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-100 via-white to-blue-50 py-10 px-4">
      <div className="max-w-6xl mx-auto">
        <div className="mb-8 rounded-3xl bg-white/80 backdrop-blur border border-slate-200 shadow-xl p-8">
          <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-6">
            <div>
              <h1 className="text-4xl font-bold tracking-tight text-slate-900">
                Analyseur de CV
              </h1>
              <p className="text-slate-600 mt-2 text-base">
                Analysez une offre d’emploi puis comparez plusieurs CV avec un rendu
                clair, moderne et professionnel.
              </p>
            </div>

            <div className="grid grid-cols-2 gap-3 md:w-[280px]">
              <div className="rounded-2xl bg-blue-50 border border-blue-100 px-4 py-4 text-center">
                <p className="text-sm text-slate-500">Mode offre</p>
                <p className="font-semibold text-slate-900">
                  {offerMode === "text" ? "Texte" : "Fichier"}
                </p>
              </div>

              <div className="rounded-2xl bg-slate-50 border border-slate-200 px-4 py-4 text-center">
                <p className="text-sm text-slate-500">CV chargés</p>
                <p className="font-semibold text-slate-900">{files.length}</p>
              </div>
            </div>
          </div>
        </div>

        <div className="grid xl:grid-cols-5 gap-6">
          <div className="xl:col-span-3 space-y-6">
            <section className="bg-white rounded-3xl shadow-lg border border-slate-200 p-6">
              <div className="flex items-center justify-between gap-4 mb-5">
                <div>
                  <p className="text-sm font-medium text-blue-600 mb-1">Étape 1</p>
                  <h2 className="text-2xl font-bold text-slate-900">L’offre d’emploi</h2>
                </div>
              </div>

              <div className="inline-flex rounded-2xl bg-slate-100 p-1 mb-5">
                <button
                  type="button"
                  onClick={() => {
                    setOfferMode("text");
                    setJobOfferFile(null);
                  }}
                  className={`px-5 py-2.5 rounded-xl text-sm font-medium transition-all ${
                    offerMode === "text"
                      ? "bg-white text-slate-900 shadow-sm"
                      : "text-slate-600 hover:text-slate-900"
                  }`}
                >
                  Saisie texte
                </button>
                <button
                  type="button"
                  onClick={() => {
                    setOfferMode("file");
                    setJobOfferText("");
                  }}
                  className={`px-5 py-2.5 rounded-xl text-sm font-medium transition-all ${
                    offerMode === "file"
                      ? "bg-white text-slate-900 shadow-sm"
                      : "text-slate-600 hover:text-slate-900"
                  }`}
                >
                  Import fichier
                </button>
              </div>

              {offerMode === "text" ? (
                <textarea
                  className="w-full h-56 p-5 rounded-2xl border border-slate-200 bg-slate-50 focus:bg-white focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none transition"
                  placeholder="Collez l’annonce ici..."
                  value={jobOfferText}
                  onChange={(e) => setJobOfferText(e.target.value)}
                />
              ) : (
                <label className="block border-2 border-dashed border-slate-300 rounded-2xl p-8 text-center bg-slate-50 hover:bg-slate-100 transition cursor-pointer">
                  <input
                    type="file"
                    accept=".pdf,.docx,.txt"
                    onChange={(e) => setJobOfferFile(e.target.files?.[0] || null)}
                    className="hidden"
                  />

                  <div className="space-y-3">
                    <div className="text-4xl">📄</div>
                    <div>
                      <p className="font-semibold text-slate-800">
                        Cliquez pour importer une offre
                      </p>
                      <p className="text-sm text-slate-500 mt-1">
                        Formats acceptés : PDF, DOCX, TXT
                      </p>
                    </div>

                    {jobOfferFile && (
                      <div className="inline-flex items-center gap-2 rounded-full bg-white border border-slate-200 px-4 py-2 text-sm text-slate-700 shadow-sm">
                        <span>✅</span>
                        <span>{jobOfferFile.name}</span>
                      </div>
                    )}
                  </div>
                </label>
              )}

              <button
                onClick={handleAnalyzeOffer}
                disabled={loadingOffer}
                className="mt-5 w-full sm:w-auto px-6 py-3 rounded-2xl bg-blue-600 hover:bg-blue-700 text-white font-semibold shadow-md disabled:bg-blue-300 transition"
              >
                {loadingOffer ? "Analyse en cours..." : "Analyser l’offre"}
              </button>

              {criteria && (
                <div className="mt-6 rounded-2xl border border-blue-100 bg-gradient-to-br from-blue-50 to-white p-5">
                  <div className="mb-4">
                    <p className="text-sm text-blue-600 font-medium">Critères détectés</p>
                    <h3 className="text-xl font-bold text-slate-900 mt-1">
                      {criteria.role_title || "Non défini"}
                    </h3>
                  </div>

                  <div className="grid md:grid-cols-2 gap-4">
                    <div className="rounded-2xl bg-white border border-slate-200 p-4">
                      <h4 className="font-semibold text-slate-900 mb-3">
                        Compétences obligatoires
                      </h4>
                      {criteria.must_have?.length ? (
                        <div className="flex flex-wrap gap-2">
                          {criteria.must_have.map((item, i) => (
                            <span
                              key={i}
                              className="px-3 py-1 rounded-full bg-blue-100 text-blue-800 text-sm"
                            >
                              {item}
                            </span>
                          ))}
                        </div>
                      ) : (
                        <p className="text-sm text-slate-500">Aucun critère obligatoire détecté.</p>
                      )}
                    </div>

                    <div className="rounded-2xl bg-white border border-slate-200 p-4">
                      <h4 className="font-semibold text-slate-900 mb-3">
                        Compétences souhaitées
                      </h4>
                      {criteria.nice_to_have?.length ? (
                        <div className="flex flex-wrap gap-2">
                          {criteria.nice_to_have.map((item, i) => (
                            <span
                              key={i}
                              className="px-3 py-1 rounded-full bg-slate-100 text-slate-700 text-sm"
                            >
                              {item}
                            </span>
                          ))}
                        </div>
                      ) : (
                        <p className="text-sm text-slate-500">Aucun critère complémentaire détecté.</p>
                      )}
                    </div>
                  </div>
                </div>
              )}
            </section>

            <section className="bg-white rounded-3xl shadow-lg border border-slate-200 p-6">
              <div className="mb-5">
                <p className="text-sm font-medium text-blue-600 mb-1">Étape 2</p>
                <h2 className="text-2xl font-bold text-slate-900">Analyse des CV</h2>
              </div>

              <label className="block border-2 border-dashed border-slate-300 rounded-2xl p-8 text-center bg-slate-50 hover:bg-slate-100 transition cursor-pointer">
                <input
                  type="file"
                  multiple
                  accept=".pdf,.docx,.txt"
                  onChange={handleFilesChange}
                  className="hidden"
                />

                <div className="space-y-3">
                  <div className="text-4xl">📂</div>
                  <div>
                    <p className="font-semibold text-slate-800">
                      Cliquez pour importer vos CV
                    </p>
                    <p className="text-sm text-slate-500 mt-1">
                      Sélection multiple autorisée
                    </p>
                  </div>
                </div>
              </label>

              {files.length > 0 && (
                <div className="mt-5 rounded-2xl border border-slate-200 bg-slate-50 p-4">
                  <p className="text-sm font-semibold text-slate-700 mb-3">
                    {files.length} fichier(s) sélectionné(s)
                  </p>
                  <div className="grid sm:grid-cols-2 gap-3">
                    {files.map((file, index) => (
                      <div
                        key={`${file.name}-${index}`}
                        className="flex items-center gap-3 rounded-xl bg-white border border-slate-200 px-4 py-3"
                      >
                        <span className="text-lg">📄</span>
                        <span className="text-sm text-slate-700 truncate">{file.name}</span>
                      </div>
                    ))}
                  </div>
                </div>
              )}

              <button
                onClick={handleRunScoring}
                disabled={!criteria || files.length === 0 || scoringProgress !== null}
                className="mt-6 w-full py-3.5 rounded-2xl bg-slate-900 hover:bg-slate-800 text-white font-bold shadow-md disabled:bg-slate-300 transition"
              >
                {scoringProgress
                  ? `Analyse : ${scoringProgress.current} / ${scoringProgress.total}`
                  : "Lancer le scoring"}
              </button>

              {scoringProgress && (
                <div className="mt-5 rounded-2xl bg-slate-50 border border-slate-200 p-4">
                  <div className="flex justify-between text-sm text-slate-600 mb-2">
                    <span>Progression</span>
                    <span>{progressPercent}%</span>
                  </div>

                  <div className="w-full h-3 rounded-full bg-slate-200 overflow-hidden">
                    <div
                      className="h-full rounded-full bg-gradient-to-r from-blue-500 to-indigo-600 transition-all duration-300"
                      style={{ width: `${progressPercent}%` }}
                    />
                  </div>

                  <p className="text-sm text-slate-600 mt-3">
                    Analyse de <strong>{scoringProgress.fileName}</strong>...
                  </p>
                </div>
              )}
            </section>

            {error && (
              <div className="rounded-2xl border border-red-200 bg-red-50 px-5 py-4 text-red-700 shadow-sm">
                {error}
              </div>
            )}
          </div>

          <div className="xl:col-span-2">
            <section className="bg-white rounded-3xl shadow-lg border border-slate-200 p-6 sticky top-6">
              <div className="mb-5">
                <p className="text-sm font-medium text-blue-600 mb-1">Résultats</p>
                <h2 className="text-2xl font-bold text-slate-900">Classement des CV</h2>
              </div>

              {results.length === 0 ? (
                <div className="rounded-2xl border border-dashed border-slate-300 bg-slate-50 p-8 text-center">
                  <div className="text-4xl mb-3">✨</div>
                  <p className="font-medium text-slate-700">
                    Les résultats apparaîtront ici
                  </p>
                  <p className="text-sm text-slate-500 mt-1">
                    Analysez d’abord une offre, puis lancez le scoring des CV.
                  </p>
                </div>
              ) : (
                <div className="space-y-4 max-h-[75vh] overflow-y-auto pr-1">
                  {results.map((r, idx) => (
                    <div
                      key={`${r.name}-${idx}`}
                      className="rounded-2xl border border-slate-200 bg-white shadow-sm overflow-hidden"
                    >
                      <div className="p-4 border-b bg-gradient-to-r from-slate-50 to-white">
                        <div className="flex items-center justify-between gap-3">
                          <div>
                            <p className="font-semibold text-slate-900 truncate">{r.name}</p>
                            <p className="text-sm text-slate-500">
                              Rang #{idx + 1}
                            </p>
                          </div>

                          <div className="shrink-0 rounded-2xl bg-blue-600 text-white px-4 py-2 text-sm font-bold shadow">
                            {r.analysis.total_score ?? 0}/100
                          </div>
                        </div>
                      </div>

                      <div className="p-4 space-y-4">
                        <div>
                          <h4 className="font-semibold text-green-700 mb-2">
                            Points forts
                          </h4>
                          {r.analysis.strengths && r.analysis.strengths.length > 0 ? (
                            <ul className="space-y-2">
                              {r.analysis.strengths.map((s, i) => (
                                <li
                                  key={i}
                                  className="text-sm text-slate-700 bg-green-50 border border-green-100 rounded-xl px-3 py-2"
                                >
                                  ✅ {s}
                                </li>
                              ))}
                            </ul>
                          ) : (
                            <p className="text-sm text-slate-500">Aucun point fort remonté.</p>
                          )}
                        </div>

                        <div>
                          <h4 className="font-semibold text-red-700 mb-2">
                            Axes d’amélioration
                          </h4>
                          {r.analysis.gaps && r.analysis.gaps.length > 0 ? (
                            <ul className="space-y-2">
                              {r.analysis.gaps.map((g, i) => (
                                <li
                                  key={i}
                                  className="text-sm text-slate-700 bg-red-50 border border-red-100 rounded-xl px-3 py-2"
                                >
                                  ⚠️ {g}
                                </li>
                              ))}
                            </ul>
                          ) : (
                            <p className="text-sm text-slate-500">Aucun axe d’amélioration remonté.</p>
                          )}
                        </div>

                        <div className="rounded-2xl bg-blue-50 border border-blue-100 p-4">
                          <p className="text-sm font-semibold text-slate-900 mb-1">
                            Recommandation
                          </p>
                          <p className="text-sm text-slate-700 italic">
                            {r.analysis.short_recommendation || "Aucune recommandation."}
                          </p>
                        </div>
                      </div>
                    </div>
                  ))}
                </div>
              )}
            </section>
          </div>
        </div>
      </div>
    </div>
  );
};

export default CvMatcherTest;