// =============================================================
// global.ink — Variables partagées entre toutes les scènes
// =============================================================
//
// Ce fichier déclare les variables globales du jeu.
// Chaque .ink de scène doit l'inclure en première ligne :
//
//     INCLUDE global.ink
//
// Règle : ne JAMAIS redéclarer ici une variable dans un fichier de scène.
// Les variables purement locales (état d'une seule scène) restent dans
// le fichier de la scène concernée.
//
// =============================================================


// --- Identité du joueur ---
// Renseignées via le formulaire de création du personnage (scène 1).
VAR player_name = ""
VAR player_age = 0


// --- Motivation initiale ---
// Choisie en scène 1. Persistante toute la partie.
// Valeurs attendues : "fuite" | "quete" | "savoir" | "silence"
VAR motivation = ""


// =============================================================
// Sections à activer au fil de l'écriture des scènes suivantes.
// Laissées en commentaire tant qu'aucune scène ne les utilise,
// pour garder le fichier minimal et lisible.
// =============================================================

// --- États narratifs majeurs ---
// VAR mentor_alive = true                 // bascule à false à la mission 4
// VAR regent_alive = true                 // bascule à false à la mission 4
// VAR bas_quartier_sauve = false          // résultat phase 4 mission 4

// --- Découvertes du joueur ---
// VAR mentor_crime_revele = false         // dialogue de confession débloqué
// VAR mentor_rehabilite_memorial = false  // plaque honorifique érigée

// --- Chemin de pouvoir ---
// Valeurs attendues : "cesar" | "medicis" | ""
// VAR chemin_pouvoir = ""

// --- Jauge de force d'expédition (ME3-like) ---
// VAR jauge_force = 0

// --- Manifestations mystiques observées (Acte I discret) ---
// VAR mystique_voix_entendue = false
// VAR mystique_regard_monstre = false
// VAR mystique_suspension = false
