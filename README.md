# Sunday School Manager

A simple, mobile-friendly web app for managing Sunday School registration, attendance, and birthdays. Built as a single HTML file powered by Supabase — designed to be hosted for free on GitHub Pages.

![License](https://img.shields.io/badge/license-MIT-green)

## Features

- **Learner Registration** — Register learners with name, date of birth, gender, parent/guardian info, and age group assignment
- **Teacher Registration** — Register teachers with contact details and assign them to age groups
- **Session Management** — Create Sunday sessions tied to an age group and teacher, with topic and notes
- **Attendance Tracking** — Toggle-based attendance for each session; automatically loads learners from the selected age group
- **Birthday Calendar** — Browse birthdays by month for both learners and teachers
- **Age Group Management** — Add, edit, and delete age groups directly from the app (no SQL needed after initial setup)
- **Dashboard** — Overview stats showing total learners, teachers, sessions, and birthdays this month
- **Fully Responsive** — Works on desktop, tablet, and phone with touch-friendly controls

## Tech Stack

- **Frontend:** Single HTML file with vanilla JavaScript and CSS (no build step)
- **Database:** [Supabase](https://supabase.com) (free tier — PostgreSQL with auto-generated REST API)
- **Hosting:** [GitHub Pages](https://pages.github.com) (free)
- **Fonts:** Google Fonts (Nunito)

## Getting Started

### 1. Set Up Supabase

1. Create a free account at [supabase.com](https://supabase.com)
2. Create a new project
3. Go to **SQL Editor** → **New Query**
4. Copy the contents of `supabase-schema.sql` and run it
5. Go to **Settings** → **API** and copy your **Project URL** and **anon/public key**

### 2. Deploy to GitHub Pages

1. Fork or clone this repository
2. Go to **Settings** → **Pages** in your GitHub repo
3. Under "Source", select **Deploy from a branch**
4. Choose `main` branch, `/ (root)` folder
5. Click **Save**
6. Your app will be live at `https://<username>.github.io/sunday-school/`

### 3. Connect the App

1. Open your GitHub Pages URL
2. Enter your Supabase **Project URL** and **Anon Key** in the setup screen
3. Click **Connect & Start**

Credentials are saved in your browser's localStorage so you only need to enter them once per device.

## Database Schema

The app uses 5 tables:

| Table | Purpose |
|-------|---------|
| `classes` | Age groups (e.g. Nursery, Primary, Teen) |
| `teachers` | Teacher profiles and class assignments |
| `learners` | Learner profiles with parent info |
| `sessions` | Sunday session records (date, age group, teacher, topic) |
| `attendance` | Per-learner attendance for each session |

Default age groups (configurable from the app):

| Group | Age Range |
|-------|-----------|
| Nursery | 0–3 years |
| Beginners | 4–5 years |
| Primary | 6–8 years |
| Junior | 9–11 years |
| Pre-Teen | 12–13 years |
| Teen | 14–17 years |
| Youth | 18+ years |

## Supabase Free Tier Limits

- 2 projects
- 500 MB database storage
- 1 GB file storage
- 2 GB bandwidth
- 50,000 monthly active auth users
- Project pauses after 1 week of inactivity (can be unpaused manually)

## Project Structure

```
sunday-school/
├── index.html            # The complete app (HTML + CSS + JS)
├── supabase-schema.sql   # Database schema to run in Supabase SQL Editor
└── README.md
```

## License

MIT
