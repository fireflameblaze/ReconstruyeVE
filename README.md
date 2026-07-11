# 🏗️ ReconstruyeVE

Plataforma colaborativa de necesidades de reconstrucción 
post-terremoto Venezuela 2026.

## ¿Qué es?

Un mapa colaborativo donde familias y líderes comunitarios 
reportan sus necesidades de reconstrucción — techos dañados, 
sistemas de agua rotos, negocios destruidos — y donde donantes, 
ONGs y voluntarios pueden verlas y responder directamente.

**Sin intermediar dinero. Sin login obligatorio. Funciona offline.**

## Stack

| Capa | Tecnología |
|---|---|
| Frontend | Next.js 14 + Tailwind CSS |
| Deploy | Vercel |
| Backend | Python + FastAPI |
| Base de datos | Supabase (PostgreSQL + PostGIS) |
| IA | Gemini API (Google AI Studio) |
| Fotos | Cloudinary |
| Mapas | Mapbox GL JS |

## Estructura del proyecto

- `/frontend` — PWA instalable en Android
- `/backend` — API REST con 5 endpoints
- `/docs` — documentación técnica y clasificación

## Cómo correr localmente

### Backend
cd backend
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
uvicorn main:app --reload

### Frontend
cd frontend
npm install
npm run dev

## Variables de entorno necesarias

### Backend (.env)
SUPABASE_URL=
SUPABASE_KEY=
GEMINI_API_KEY=

### Frontend (.env.local)
NEXT_PUBLIC_API_URL=http://localhost:8000
NEXT_PUBLIC_MAPBOX_TOKEN=

## Categorías de necesidades

1. 🏠 Vivienda — techo y estructura dañada
2. 💧 Agua — sin agua potable ni saneamiento
3. ⚡ Eléctrico — sin electricidad
4. 🏥 Comunidad — centros de salud y escuelas
5. 🏪 Economía — pequeños negocios y sustento
6. 🚪 Carpintería — rejas y seguridad del hogar
ℹ️ Vialidad — informativo para organismos gubernamentales

## Contribuir

Este es un proyecto humanitario voluntario. 
Si quieres contribuir, abre un Issue o un Pull Request.

## Licencia

MIT — libre para usar, modificar y replicar en otros países.
