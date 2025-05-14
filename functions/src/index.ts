import { onRequest } from "firebase-functions/v2/https";
import * as logger from "firebase-functions/logger";

// Bu endpoint artık CORS destekli
export const myApi = onRequest((req, res) => {
    // CORS header'ları
    res.set("Access-Control-Allow-Origin", "*");
    res.set("Access-Control-Allow-Methods", "GET, POST, OPTIONS");
    res.set("Access-Control-Allow-Headers", "Content-Type");

    // Preflight (OPTIONS) kontrolü
    if (req.method === "OPTIONS") {
        res.status(204).send('');
        return;
    }

    // Normal istekler
    logger.info("Request received!", { structuredData: true });
    res.status(200).send("Merhaba! Bu istek CORS uyumlu.");
});
