import axios from "axios";

const API_BASE = "/api";

export const analyzeOffer = async (formData: FormData) => {
  const response = await fetch(`${API_BASE}/analyze-offer`, {
    method: "POST",
    body: formData,
  });

  if (!response.ok) {
    throw new Error(`analyzeOffer failed with status ${response.status}`);
  }

  return response.json();
};

export const scoreCv = async (formData: FormData) => {
  const response = await axios.post(`${API_BASE}/score-cv`, formData);
  return response.data;
};
