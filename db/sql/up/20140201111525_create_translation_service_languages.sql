CREATE TABLE IF NOT EXISTS translation_service_languages
(
  translation_service_id TEXT NOT NULL,
  source_language TEXT NOT NULL,
  target_language TEXT NOT NULL,
  PRIMARY KEY(translation_service_id, source_language, target_language)
  FOREIGN KEY(translation_service_id) REFERENCES translation_services(id)
);