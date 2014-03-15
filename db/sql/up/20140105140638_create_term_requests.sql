CREATE TABLE IF NOT EXISTS term_requests
(
  'id' INTEGER PRIMARY KEY AUTOINCREMENT,
  'term' TEXT NOT NULL,
  'source_language' TEXT NOT NULL,
  'target_language' TEXT NOT NULL,
  'service' TEXT NOT NULL
);