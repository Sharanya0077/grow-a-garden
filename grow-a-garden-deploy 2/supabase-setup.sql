-- Run this in Supabase Dashboard -> SQL Editor -> New query -> Run.
create table if not exists public.flowers (
  id text primary key,
  data jsonb not null,
  created_at timestamptz not null default now()
);

alter table public.flowers enable row level security;

-- Public visitors can view flowers and add new ones.
create policy "Anyone can view garden flowers"
on public.flowers for select
to anon, authenticated
using (true);

create policy "Anyone can plant a garden flower"
on public.flowers for insert
to anon, authenticated
with check (true);

-- Allow the app to update a row with the same ID if a retry happens.
create policy "Anyone can update garden flowers"
on public.flowers for update
to anon, authenticated
using (true)
with check (true);

-- Realtime: after creating the table, open Database -> Publications -> supabase_realtime
-- and make sure the flowers table is enabled for realtime updates.
