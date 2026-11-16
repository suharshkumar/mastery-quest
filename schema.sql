create table if not exists public.entries (id text primary key, user_id uuid not null default auth.uid() references auth.users(id) on delete cascade, date date not null, plan text not null, phase text, hours numeric(5,2) not null check (hours > 0 and hours <= 18), note text check (char_length(note) <= 2000), ts bigint, created_at timestamptz not null default now());
create index if not exists entries_user_date on public.entries (user_id, date);
create table if not exists public.phase_done (user_id uuid not null default auth.uid() references auth.users(id) on delete cascade, key text not null, done_on date not null, primary key (user_id, key));
alter table public.entries enable row level security;
alter table public.phase_done enable row level security;
create policy "own entries" on public.entries for all to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "own phases" on public.phase_done for all to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
revoke all on public.entries, public.phase_done from anon;
grant select, insert, update, delete on public.entries, public.phase_done to authenticated;
