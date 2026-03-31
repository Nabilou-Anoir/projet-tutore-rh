import axios from "axios";

const API_BASE = "http://127.0.0.1:8000";

export const analyzeOffer = async (formData: FormData) => {
  const response = await fetch("http://localhost:8000/analyze-offer", {
    method: "POST",
    body: formData,
  });

  return await response.json();
};
export const scoreCv = async (formData: FormData) => {
  const response = await axios.post(`${API_BASE}/score-cv`, formData);
  return response.data;
};