# MARKEKINGCOM - Skills Memory Database

## Descripción
Base de conocimiento operativa de MARKEKINGCOM. Contiene 229 skills organizados en dos fuentes:
- **55 skills locales**: Core skills de la agencia
- **174 skills-pack**: Skills adicionales del plugin pack

## Base de Datos
Los skills están almacenados en Supabase (proyecto: markeking-brain, región: eu-central-1).

Project ID: `jbpcqbqsfvytbzbxepvp`
URL: `https://jbpcqbqsfvytbzbxepvp.supabase.co`

## Archivos
- `schema.sql` - Schema DDL de la base de datos
- `skills_index.md` - Índice completo de los 229 skills
- `export.sql` - Queries útiles para exportar/buscar skills

## Búsqueda Full-Text (Español)
```sql
SELECT name, description FROM skills WHERE fts @@ plainto_tsquery('spanish', 'tu búsqueda');
```

## Última actualización
2026-04-02
