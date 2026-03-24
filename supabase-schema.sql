-- ============================================
-- Sunday School Management App - Supabase Schema
-- ============================================
-- Run this SQL in your Supabase SQL Editor
-- (Dashboard > SQL Editor > New Query)
-- ============================================

-- 1. CLASSES / AGE GROUPS TABLE
CREATE TABLE classes (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  age_range TEXT,
  sort_order INT DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- Insert predefined age groups
INSERT INTO classes (name, age_range, sort_order) VALUES
  ('Nursery', '0-3 years', 1),
  ('Beginners', '4-5 years', 2),
  ('Primary', '6-8 years', 3),
  ('Junior', '9-11 years', 4),
  ('Pre-Teen', '12-13 years', 5),
  ('Teen', '14-17 years', 6),
  ('Youth', '18+ years', 7);

-- 2. TEACHERS TABLE
CREATE TABLE teachers (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  phone TEXT,
  email TEXT,
  class_id UUID REFERENCES classes(id),
  date_of_birth DATE,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- 3. LEARNERS TABLE
CREATE TABLE learners (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  date_of_birth DATE,
  gender TEXT CHECK (gender IN ('Male', 'Female')),
  parent_name TEXT,
  parent_phone TEXT,
  class_id UUID REFERENCES classes(id),
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- 4. SESSIONS TABLE (each Sunday session)
CREATE TABLE sessions (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  session_date DATE NOT NULL,
  class_id UUID REFERENCES classes(id),
  teacher_id UUID REFERENCES teachers(id),
  topic TEXT,
  notes TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- 5. ATTENDANCE TABLE
CREATE TABLE attendance (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  session_id UUID REFERENCES sessions(id) ON DELETE CASCADE,
  learner_id UUID REFERENCES learners(id),
  present BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT now(),
  UNIQUE(session_id, learner_id)
);

-- ============================================
-- ROW LEVEL SECURITY (allow public access)
-- Since this is a simple app without auth,
-- we enable RLS but allow all operations.
-- ============================================

ALTER TABLE classes ENABLE ROW LEVEL SECURITY;
ALTER TABLE teachers ENABLE ROW LEVEL SECURITY;
ALTER TABLE learners ENABLE ROW LEVEL SECURITY;
ALTER TABLE sessions ENABLE ROW LEVEL SECURITY;
ALTER TABLE attendance ENABLE ROW LEVEL SECURITY;

-- Public access policies
CREATE POLICY "Allow all on classes" ON classes FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "Allow all on teachers" ON teachers FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "Allow all on learners" ON learners FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "Allow all on sessions" ON sessions FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "Allow all on attendance" ON attendance FOR ALL USING (true) WITH CHECK (true);
