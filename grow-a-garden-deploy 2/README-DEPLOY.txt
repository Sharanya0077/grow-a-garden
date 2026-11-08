GROW A GARDEN - DEPLOY + SHARED SUPABASE SETUP

COST
Netlify Free + Supabase Free are enough for a small personal project. You do not need to enter payment details or upgrade. Keep auto-recharge/add-ons off and stay on the Free plans. Free services have usage limits; Supabase free projects can pause after inactivity.

PART 1: CREATE THE SHARED DATABASE
1. Go to https://supabase.com/ and sign up. Create a new project on the Free plan. Save the database password somewhere private.
2. In the project, open SQL Editor -> New query.
3. Open supabase-setup.sql from this folder, copy all its contents into the SQL editor, and click Run. This creates the flowers table and public read/insert/update policies.
4. For live updates, open Database -> Publications -> supabase_realtime and enable the public.flowers table. If your dashboard shows a Realtime configuration screen instead, enable Realtime for the flowers table there.
5. Open Project Settings -> API (or Connect, depending on dashboard layout). Copy the Project URL and the publishable/anon key. The key is intended for browser use. NEVER use the secret key or service_role key in this website.

PART 2: ADD THE SUPABASE DETAILS
1. Open index.html in VS Code.
2. Find these two lines near the start of the main JavaScript:
   const SUPABASE_URL='YOUR_SUPABASE_PROJECT_URL';
   const SUPABASE_ANON_KEY='YOUR_SUPABASE_ANON_OR_PUBLISHABLE_KEY';
3. Replace the first placeholder with your Project URL and the second with your publishable/anon key. Keep the quotes. Do not share a service_role/secret key.
4. Save index.html.

PART 3: DEPLOY TO NETLIFY
1. Go to https://app.netlify.com/drop and sign in.
2. Drag this whole extracted folder (the one containing index.html) into the drop area.
3. Publish the site. If you already have a Netlify site, deploy this updated folder to that existing site instead of creating a new one.

TEST IT
1. Open your live site and plant a flower with a message.
2. Open the same URL in a private/incognito window or on another device. The flower should appear there too.
3. If flowers do not sync, check that the Project URL/key are correct, the SQL ran successfully, and Realtime is enabled for public.flowers.

IMPORTANT
- The starter flowers are decorative and built into the page. New visitor flowers are saved in Supabase and shared across visitors.
- This is a public guestbook-style garden: anyone can read and add flowers. Do not collect private or sensitive information.
- Public insert permissions mean strangers can submit content. For a tiny personal project this is the simplest setup, but if the site gets spammed, add CAPTCHA/rate limiting or stricter moderation.
- If Supabase is not configured yet, the page still works with browser-only localStorage, but flowers will not be shared.
