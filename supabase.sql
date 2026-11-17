-- Rode no SQL Editor do Supabase.
create table if not exists public.progresso (
  user_id uuid primary key references auth.users(id) on delete cascade,
  estado jsonb not null default '{}'::jsonb,
  atualizado_em timestamptz not null default now()
);

alter table public.progresso enable row level security;

create policy "le o proprio progresso" on public.progresso
  for select to authenticated using ((select auth.uid()) = user_id);
create policy "insere o proprio progresso" on public.progresso
  for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "atualiza o proprio progresso" on public.progresso
  for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);


-- Resumos (aba RESUMOS do app). Conteúdo em Markdown, editável pelo próprio app.
create table if not exists public.resumos (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  materia text not null,
  bloco text not null default '',
  titulo text not null,
  conteudo text not null default '',
  ordem integer not null default 0,
  criado_em timestamptz not null default now(),
  atualizado_em timestamptz not null default now()
);
create index if not exists resumos_user_id_idx on public.resumos(user_id);

alter table public.resumos enable row level security;

create policy "le os proprios resumos" on public.resumos
  for select to authenticated using ((select auth.uid()) = user_id);
create policy "insere os proprios resumos" on public.resumos
  for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "atualiza os proprios resumos" on public.resumos
  for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
create policy "apaga os proprios resumos" on public.resumos
  for delete to authenticated using ((select auth.uid()) = user_id);

create or replace function public.resumos_toca_data()
returns trigger language plpgsql set search_path = '' as $$
begin new.atualizado_em := now(); return new; end $$;

create trigger resumos_atualizado_em before update on public.resumos
  for each row execute function public.resumos_toca_data();
