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