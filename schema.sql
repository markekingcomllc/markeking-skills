-- MARKEKINGCOM Skills Database Schema
-- Supabase Project: markeking-brain (jbpcqbqsfvytbzbxepvp)
-- Region: eu-central-1

CREATE TABLE public.skills (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  description TEXT,
  content TEXT NOT NULL,
  source TEXT NOT NULL DEFAULT 'local' CHECK (source IN ('local', 'skills-pack')),
  category TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_skills_name ON public.skills(name);
CREATE INDEX idx_skills_source ON public.skills(source);
CREATE INDEX idx_skills_category ON public.skills(category);

ALTER TABLE public.skills ADD COLUMN fts tsvector
  GENERATED ALWAYS AS (to_tsvector('spanish', coalesce(name, '') || ' ' || coalesce(description, '') || ' ' || coalesce(content, ''))) STORED;
CREATE INDEX idx_skills_fts ON public.skills USING GIN(fts);

COMMENT ON TABLE public.skills IS 'Memoria de skills de MARKEKINGCOM - base de conocimiento operativa';
