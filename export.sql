-- Queries útiles para la base de datos de skills

-- Contar skills por fuente
SELECT source, count(*) FROM skills GROUP BY source;

-- Buscar skills por texto (full-text search en español)
SELECT name, description 
FROM skills 
WHERE fts @@ plainto_tsquery('spanish', 'email marketing');

-- Exportar todos los skills como JSON
SELECT json_agg(row_to_json(s)) 
FROM (SELECT name, description, content, source FROM skills ORDER BY name) s;

-- Buscar por nombre
SELECT * FROM skills WHERE name ILIKE '%viral%';

-- Skills locales
SELECT name, description FROM skills WHERE source = 'local' ORDER BY name;

-- Skills del pack
SELECT name, description FROM skills WHERE source = 'skills-pack' ORDER BY name;
