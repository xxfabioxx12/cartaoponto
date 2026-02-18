export default function handler(req, res) {
  res.setHeader('Cache-Control', 'no-store');
  res.json({
    supabaseUrl: process.env.VITE_SUPABASE_URL || process.env.SUPABASE_URL || 'https://ebhzsddqmjnxzcecgyrv.supabase.co',
    supabaseKey: process.env.VITE_SUPABASE_ANON_KEY || process.env.SUPABASE_ANON_KEY || 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImViaHpzZGRxbWpueHpjZWNneXJ2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzEyNTk2MzMsImV4cCI6MjA4NjgzNTYzM30.FiQzaDQ7zifJsHJdVwAhP96y_gA_pPPfZtfGp_ZeWJk',
  });
}
