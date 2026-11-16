-- Rode no SQL Editor do Supabase.
create table if not exists public.progresso (
  user_id uuid primary key references auth.users(id) on delete cascade,
  estado jsonb not null default '{}'::jsonb,
  atualizado_em timestamptz not null default now()
);

alter table public.progresso enable row level security;

create policy "le o proprio progresso" on public.progresso
  for select using ((select auth.uid()) = user_id);
create policy "insere o proprio progresso" on public.progresso
  for insert with check ((select auth.uid()) = user_id);
create policy "atualiza o proprio progresso" on public.progresso
  for update using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
