# Mastery Quest

A game-style tracker for a 10-year, 21-plan mastery journey: daily session log, weekly targets per track, phase checklists ("bosses"), XP, streaks and a pace projection.

- Live site: https://suharshkumar.github.io/mastery-quest/
- Sign up with email and password. Accounts and data are stored in Supabase; Row Level Security lets each user read and write only their own rows (`schema.sql`).
- The key in `index.html` is Supabase's publishable key, which is meant to be public. Never commit a secret key.
