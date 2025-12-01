/*
1. Catalogue public des morceaux:
Le service Produit souhaite afficher une liste publique des morceaux, contenant :

les informations du morceau, --tracks(title)
la durée, --tracks(duration_s)
le nom de l’artiste associé. --track (artist_id => artists(name))
Créer une vue adaptée à ce besoin, puis l’utiliser pour lister l’ensemble du catalogue de manière ordonnée.
*/
CREATE OR REPLACE VIEW sql_avancee_exercice_1_schema.v_tracs_public AS
SELECT
    t.track_id,
	t.title,
	t.duration_s as duration_track,
    a.name as artiste_name 
FROM sql_avancee_exercice_1_schema.tracks as t
JOIN sql_avancee_exercice_1_schema.artists as a
	ON t.artist_id = a.artist_id;

/*
2. Utilisateurs Premium français
L’équipe marketing souhaite travailler spécifiquement sur les utilisateurs :

ayant un abonnement Premium,--users(subscription)
résidant en France. --users(country)

Créer une vue filtrée permettant d’identifier ces utilisateurs, puis l’utiliser pour obtenir une liste ordonnée.
*/
CREATE OR REPLACE VIEW sql_avancee_exercice_1_schema.v_users_premium AS
SELECT
    u.user_id,
	u.subscription,
	u.country,
	l.track_id, 
	l.listened_at, 
	l.seconds_played
FROM sql_avancee_exercice_1_schema.users u
LEFT JOIN  sql_avancee_exercice_1_schema.listenings l
	on u.user_id = l.user_id
WHERE subscription = 'Premium'
	AND country = 'France'

/*
4. Statistiques d’écoute par artiste
Pour optimiser l’analyse, cette statistique doit être construite à partir d’une vue matérialisée reposant sur les écoutes détaillées :

Pour chaque artiste, calculer :

le nombre total d’écoutes,
le nombre total de secondes écoutées,
la durée moyenne écoutée par écoute.
Créer cette vue matérialisée, puis l’utiliser pour identifier les artistes les plus écoutés selon différents critères (par exemple ceux qui ont un nombre d’écoutes élevé, ou un volume total de lecture important).
*/
CREATE MATERIALIZED VIEW mv_listenings_stats AS
SELECT COUNT()
FROM sql_avancee_exercice_1_schema.artists a
	
GROUP BY artist_id


