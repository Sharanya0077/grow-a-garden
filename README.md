# 🌷 Grow a Garden

*A little corner of the internet where every flower holds a thought and every visitor leaves a little magic.*

**Grow a Garden** is an interactive virtual garden where visitors can plant flowers, leave personal messages, and contribute to a shared digital meadow. Each flower represents a little thought, memory, wish, or message left behind by someone who visits.

The idea is simple: plant something lovely and let the garden grow. 🌱

## ✨ Features

- 🌸 **Interactive Flower Planting:** Choose different flower types and colours, add your name and a personal message, and plant your flower.
- 🌿 **Shared Garden:** Supabase integration allows flowers and messages to be stored in a central database and shared across visitors.
- 📖 **Garden Journal:** Browse the messages and flowers planted in the garden.
- 🌞 **Day & Night Mode:** Switch between a warm daytime meadow and a dreamy night garden.
- 💧 **Interactive Elements:** Water the garden and explore its little details.
- 🎵 **Ethereal Soundtrack:** An original, synthesised garden melody created using the Web Audio API.
- ✨ **Animations & Visual Effects:** Flower growth animations, gentle movement, sparkles, clouds and atmospheric effects.
- 📱 **Responsive Design:** Designed to work across desktop and mobile screens.

## 🛠️ Tech Stack

| Technology | Purpose |
|---|---|
| HTML5 | Website structure |
| CSS3 | Styling, layouts and animations |
| JavaScript | Interactivity and application logic |
| Supabase | Database and shared garden functionality |
| Web Audio API | Generating the ethereal soundtrack |
| Netlify | Website hosting and deployment |

## ⚙️ Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/YOUR-USERNAME/YOUR-REPOSITORY.git
```

### 2. Open the project

```bash
cd YOUR-REPOSITORY
```

Open `index.html` using VS Code.

You can run the project locally using the Live Server extension.

### 3. Configure Supabase

Create a project at [Supabase](https://supabase.com/).

In your Supabase project:

1. Open the SQL Editor.
2. Create a table named `flowers` in the `public` schema.
3. Configure the database policies to allow public reading and insertion, along with the update permission required for upserts.
4. Enable the `flowers` table in the `supabase_realtime` publication.

The table uses the following structure:

| Column | Type | Purpose |
|---|---|---|
| id | text | Unique flower identifier |
| data | jsonb | Stores flower details and message |
| created_at | timestamptz | Records when the flower was created |

Example SQL setup:

```sql
create table if not exists public.flowers (
  id text primary key,
  data jsonb not null,
  created_at timestamptz default now()
);

alter table public.flowers enable row level security;

create policy "Anyone can view flowers"
on public.flowers
for select
to anon
using (true);

create policy "Anyone can plant flowers"
on public.flowers
for insert
to anon
with check (true);

create policy "Anyone can update flowers"
on public.flowers
for update
to anon
using (true)
with check (true);

alter publication supabase_realtime
add table public.flowers;
```

If the table or publication already exists, check its configuration rather than running duplicate setup commands.

### 4. Add your Supabase credentials

Open `index.html` and locate:

```javascript
const SUPABASE_URL = 'YOUR_SUPABASE_PROJECT_URL';
const SUPABASE_ANON_KEY = 'YOUR_SUPABASE_ANON_OR_PUBLISHABLE_KEY';
```

Replace the placeholders with your Supabase Project URL and Publishable Key.

**Security note:** Only use the publishable key in frontend code. Never expose your Supabase secret or service-role key.

The public policies above allow anyone to read, insert and update records. This is suitable only for a small experimental project. Add stronger validation, spam protection and moderation before using it for a larger public audience.

## 🚀 Deployment

The project can be deployed using [Netlify](https://www.netlify.com/).

1. Push the project to GitHub.
2. Open Netlify and import your GitHub repository, or use Netlify Drop.
3. Deploy the folder containing `index.html`.
4. Share your live website link!

## 🌼 Project Vision

Grow a Garden is built around a small idea: the internet can be a place for people to leave something beautiful behind.

Instead of likes, followers or numbers, visitors leave flowers and little messages. Over time, these contributions create a shared digital space filled with thoughts from different people.

## 💌 Author

Created with love by **Sharu**.

*Plant something lovely. Leave a little magic. ♡*
