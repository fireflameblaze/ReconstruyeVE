#!/bin/bash

# ============================================================
# Script para crear todos los Issues del Sprint en GitHub
# Repositorio: fireflameblaze/ReconstruyeVE
# 
# REQUISITOS:
#   1. Tener GitHub CLI instalado: https://cli.github.com
#   2. Estar autenticado: gh auth login
#   3. Ejecutar: bash crear_issues_github.sh
# ============================================================

REPO="fireflameblaze/ReconstruyeVE"

echo "🏗️ Creando labels en ReconstruyeVE..."

# ── LABELS ──────────────────────────────────────────────────
gh label create "semana-1" --color "1a5c38" --description "Sprint Semana 1 — Fundamentos" --repo $REPO 2>/dev/null
gh label create "semana-2" --color "2d7a4f" --description "Sprint Semana 2 — Offline + IA" --repo $REPO 2>/dev/null
gh label create "semana-3" --color "4a7c59" --description "Sprint Semana 3 — Calidad" --repo $REPO 2>/dev/null
gh label create "semana-4" --color "63c94a" --description "Sprint Semana 4 — Lanzamiento" --repo $REPO 2>/dev/null
gh label create "backend" --color "185fa5" --description "Tarea de backend — Tu hijo" --repo $REPO 2>/dev/null
gh label create "frontend" --color "6a1b9a" --description "Tarea de frontend — Tu amigo" --repo $REPO 2>/dev/null
gh label create "coordinacion" --color "854f0b" --description "Tarea de coordinación — Mauri" --repo $REPO 2>/dev/null
gh label create "ia" --color "0d47a1" --description "Inteligencia Artificial — Gemini API" --repo $REPO 2>/dev/null
gh label create "critico" --color "e24b4a" --description "Bloqueante — debe resolverse primero" --repo $REPO 2>/dev/null
gh label create "definition-of-done" --color "f9a825" --description "Criterio de aceptación de la semana" --repo $REPO 2>/dev/null

echo "✅ Labels creados"
echo ""
echo "📋 Creando Issues — Semana 1..."

# ── SEMANA 1 ─────────────────────────────────────────────────

gh issue create \
  --repo $REPO \
  --title "[S1-D1] Backend: Crear proyecto FastAPI y configurar Supabase" \
  --body "## Día 1 · Lunes · Semana 1

### Tareas
- [ ] Crear proyecto FastAPI con estructura de carpetas (main.py, routers/, services/, database.py)
- [ ] Crear cuenta en Supabase y proyecto \`reconstruye-ve\`
- [ ] Ejecutar el esquema SQL completo (tablas reportes, confirmaciones, usuarios + índices PostGIS)
- [ ] Configurar archivo .env con SUPABASE_URL y SUPABASE_KEY
- [ ] Verificar conexión a Supabase desde FastAPI

### Criterio de aceptación
La API corre localmente con \`uvicorn main:app --reload\` sin errores y la conexión a Supabase es exitosa.

### Recursos
- Esquema SQL completo en \`/docs/modelo-datos.md\`
- Stack: Python + FastAPI + Supabase (PostgreSQL + PostGIS)" \
  --label "semana-1,backend,critico"

gh issue create \
  --repo $REPO \
  --title "[S1-D1] Frontend: Crear proyecto Next.js y configurar Mapbox" \
  --body "## Día 1 · Lunes · Semana 1

### Tareas
- [ ] Crear proyecto Next.js 14 con Tailwind CSS: \`npx create-next-app@latest frontend --typescript --tailwind --app\`
- [ ] Instalar Mapbox GL JS: \`npm install mapbox-gl react-map-gl\`
- [ ] Crear token gratuito en mapbox.com
- [ ] Crear \`public/manifest.json\` para que la app sea instalable como PWA
- [ ] Configurar \`.env.local\` con NEXT_PUBLIC_MAPBOX_TOKEN y NEXT_PUBLIC_API_URL

### Criterio de aceptación
La app corre con \`npm run dev\` y se ve una pantalla en blanco sin errores en la consola.

### Recursos
- Design brief completo con paleta, tipografía y componentes disponible
- Mapbox GL JS docs: https://docs.mapbox.com/mapbox-gl-js" \
  --label "semana-1,frontend,critico"

gh issue create \
  --repo $REPO \
  --title "[S1-D2] Backend: Implementar GET /api/reportes y cargar datos de prueba" \
  --body "## Día 2 · Martes · Semana 1

### Tareas
- [ ] Implementar \`GET /api/reportes\` — devuelve todos los reportes activos en JSON
- [ ] Insertar 10 reportes de prueba a mano en Supabase (distribuidos en los 6 barrios de Caracas)
- [ ] Probar el endpoint con Postman o curl — debe devolver JSON correcto
- [ ] Asegurarse que la respuesta incluye: id, categoria, descripcion, lat, lng, estado, zona, confirmaciones

### Criterio de aceptación
\`curl http://localhost:8000/api/reportes\` devuelve un JSON con al menos 10 reportes de prueba.

### Datos de prueba sugeridos
- Las Palmas, Miranda → techo
- El Paraíso, Caracas → agua
- La Vega, Caracas → electrico
- Petare, Miranda → negocio
- Antimano, Caracas → comunidad" \
  --label "semana-1,backend"

gh issue create \
  --repo $REPO \
  --title "[S1-D2] Frontend: Pantalla del mapa con marcadores ficticios" \
  --body "## Día 2 · Martes · Semana 1

### Tareas
- [ ] Pantalla del mapa centrado en Caracas (lat: 10.4806, lng: -66.9036, zoom: 12)
- [ ] Agregar 5 marcadores ficticios hardcodeados para probar los colores por categoría
- [ ] Color por categoría: techo=#e07b3a, agua=#3a7be0, electrico=#e0c43a, negocio=#7b3ae0, comunidad=#3ae07b
- [ ] Barra de navegación inferior: Mapa / Lista / Reportar

### Criterio de aceptación
El mapa de Caracas se ve con 5 pines de colores distintos al abrir la app en el navegador.

### Notas de diseño
- Tipografía: Space Grotesk (títulos) + Inter (cuerpo)
- Verde principal: #1a5c38
- Los íconos usan la librería Tabler Icons" \
  --label "semana-1,frontend"

gh issue create \
  --repo $REPO \
  --title "[S1-D3] Backend: Implementar POST /api/reportes y configurar CORS" \
  --body "## Día 3 · Miércoles · Semana 1

### Tareas
- [ ] Implementar \`POST /api/reportes\` — crea un reporte nuevo en Supabase
- [ ] Validar campos obligatorios: categoria, descripcion, lat, lng, estado_vzla, device_id
- [ ] Generar UUID automático para el campo \`id\`
- [ ] Configurar CORS en FastAPI para permitir requests desde el frontend (localhost:3000 y Vercel)
- [ ] Retornar 201 con el ID del reporte creado

### Criterio de aceptación
Un POST con body JSON válido crea un reporte en Supabase y devuelve 201 con el nuevo ID.

### Formato de respuesta esperado
\`\`\`json
{
  'id': 'uuid-generado',
  'es_duplicado': false,
  'grupo_duplicado': null,
  'mensaje': 'Reporte creado exitosamente'
}
\`\`\`" \
  --label "semana-1,backend,critico"

gh issue create \
  --repo $REPO \
  --title "[S1-D3] Frontend: Conectar mapa con API real de Supabase" \
  --body "## Día 3 · Miércoles · Semana 1

### Tareas
- [ ] Reemplazar marcadores ficticios por datos reales del \`GET /api/reportes\`
- [ ] Implementar \`lib/api.ts\` con la función \`getReportes()\`
- [ ] Mostrar ícono distinto según la categoría del reporte
- [ ] Popup al tocar un marcador: nombre del lugar, zona y descripción breve
- [ ] Loading state mientras cargan los datos del API

### Criterio de aceptación
El mapa muestra los 10 reportes de prueba reales cargados en Supabase, con el ícono y color correcto por categoría." \
  --label "semana-1,frontend,critico"

gh issue create \
  --repo $REPO \
  --title "[S1-D4] Backend: Implementar GET /api/reportes/{id}" \
  --body "## Día 4 · Jueves · Semana 1

### Tareas
- [ ] Implementar \`GET /api/reportes/{id}\` — devuelve el detalle completo de un reporte
- [ ] Incluir en la respuesta: confirmaciones_detalle (sigue_activo + ya_resuelto) y reportes_similares
- [ ] Retornar 404 si el reporte no existe con mensaje claro

### Criterio de aceptación
\`GET /api/reportes/{id-valido}\` devuelve todos los campos del reporte más el detalle de confirmaciones." \
  --label "semana-1,backend"

gh issue create \
  --repo $REPO \
  --title "[S1-D4] Frontend: Formulario de reporte — pantalla 2" \
  --body "## Día 4 · Jueves · Semana 1

### Tareas
- [ ] Selector de categoría — 6 pills: Vivienda / Agua / Eléctrico / Salud / Negocio / Carpintería
- [ ] Campo de descripción — textarea, máximo 300 caracteres con contador
- [ ] Campo sector/barrio — input de texto libre
- [ ] Selector de estado de Venezuela — dropdown con los 24 estados
- [ ] Botón de GPS — detecta ubicación automáticamente con \`navigator.geolocation\`
- [ ] Validación básica — no enviar si faltan campos obligatorios

### Criterio de aceptación
El formulario se ve completo y la validación impide enviar sin categoría, descripción y ubicación." \
  --label "semana-1,frontend"

gh issue create \
  --repo $REPO \
  --title "[S1-D5] Backend: Implementar POST /api/reportes/{id}/confirmar" \
  --body "## Día 5 · Viernes · Semana 1

### Tareas
- [ ] Implementar \`POST /api/reportes/{id}/confirmar\`
- [ ] Aceptar: tipo (sigue_activo | ya_resuelto), device_id, usuario_id (opcional)
- [ ] Validar que el mismo device_id no pueda confirmar el mismo reporte dos veces (UNIQUE constraint)
- [ ] Lógica de auto-resolución: si ya_resuelto llega a 5 → cambiar estado del reporte a 'resuelto'
- [ ] Retornar confirmaciones_activo, confirmaciones_resuelto y estado_actual

### Criterio de aceptación
Con 5 llamadas POST de confirmar con tipo='ya_resuelto' y device_ids distintos, el reporte cambia a estado 'resuelto' automáticamente." \
  --label "semana-1,backend,critico"

gh issue create \
  --repo $REPO \
  --title "[S1-D5] Frontend: Conectar formulario con POST /api/reportes" \
  --body "## Día 5 · Viernes · Semana 1

### Tareas
- [ ] Conectar el formulario con \`POST /api/reportes\` usando \`lib/api.ts\`
- [ ] Generar device_id único y guardarlo en localStorage
- [ ] El reporte nuevo aparece en el mapa sin recargar la página completa
- [ ] Toast de confirmación: 'Tu reporte fue publicado'
- [ ] Estado de loading en el botón mientras se envía

### Criterio de aceptación
Crear un reporte desde el formulario lo hace aparecer en el mapa en menos de 2 segundos." \
  --label "semana-1,frontend"

gh issue create \
  --repo $REPO \
  --title "[S1-D6] Backend: Implementar POST /api/sync y deploy en Railway" \
  --body "## Día 6 · Sábado · Semana 1

### Tareas
- [ ] Implementar \`POST /api/sync\` — recibe array de reportes pendientes y los procesa en orden
- [ ] Retornar array de resultados con id_local, id_servidor y es_duplicado por cada reporte
- [ ] Crear cuenta en Railway y conectar el repositorio de GitHub
- [ ] Agregar variables de entorno en Railway: SUPABASE_URL, SUPABASE_KEY, GEMINI_API_KEY
- [ ] Primera URL pública del backend disponible

### Criterio de aceptación
El backend tiene una URL pública en Railway que responde correctamente a \`GET /\` con {status: 'ok'}." \
  --label "semana-1,backend"

gh issue create \
  --repo $REPO \
  --title "[S1-D6] Frontend: Pantalla de detalle — pantalla 3" \
  --body "## Día 6 · Sábado · Semana 1

### Tareas
- [ ] Pantalla de detalle al tocar un marcador o una tarjeta de lista
- [ ] Header verde con: categoría, título/descripción completa, zona y estado
- [ ] Contador de confirmaciones comunitarias (número grande + texto explicativo)
- [ ] Dos botones: 'Todavía se necesita' y 'Ya fue atendido'
- [ ] Botón de volver al mapa

### Criterio de aceptación
Tocar un marcador del mapa abre la pantalla de detalle con la información correcta del reporte." \
  --label "semana-1,frontend"

gh issue create \
  --repo $REPO \
  --title "[S1-D7] Meta de Semana 1 — Demo en teléfono Android real" \
  --body "## Día 7 · Domingo · Semana 1

### Tareas — Backend
- [ ] Prueba end-to-end completa: crear reporte → aparece en mapa → confirmar → contador sube
- [ ] Corregir cualquier error de CORS o respuesta incorrecta detectado en la prueba

### Tareas — Frontend
- [ ] Subir frontend a Vercel: \`vercel --prod\` o conectar repo en vercel.com
- [ ] Configurar NEXT_PUBLIC_API_URL con la URL de Railway en Vercel
- [ ] Abrir la URL de Vercel en un teléfono Android real (no emulador)
- [ ] Verificar las 3 pantallas funcionando: mapa → formulario → detalle

### ✅ Definition of Done — Semana 1
- [ ] El mapa muestra reportes reales de Supabase
- [ ] Se puede crear un reporte desde el formulario
- [ ] La pantalla de detalle muestra el reporte correctamente
- [ ] El botón 'confirmar' suma al contador
- [ ] Hay una URL pública de Vercel que funciona
- [ ] El equipo lo prueba en un teléfono Android real

### Entregable
Screenshot o video corto del equipo usando la app en un teléfono Android real — compartir en el grupo de WhatsApp del proyecto." \
  --label "semana-1,critico,definition-of-done"

echo "✅ Semana 1 creada (13 issues)"
echo ""
echo "📋 Creando Issues — Semana 2..."

# ── SEMANA 2 ─────────────────────────────────────────────────

gh issue create \
  --repo $REPO \
  --title "[S2-D8] IA: Configurar Gemini API y probar prompt de deduplicación" \
  --body "## Día 8 · Lunes · Semana 2

### Tareas
- [ ] Crear cuenta en Google AI Studio: https://aistudio.google.com
- [ ] Obtener API Key de Gemini (gratuita — 15 req/min, 1M tokens/día)
- [ ] Probar manualmente el prompt de deduplicación en la interfaz web de AI Studio
- [ ] Ajustar el prompt hasta que Gemini responda JSON válido de forma consistente
- [ ] Agregar GEMINI_API_KEY al .env local y a Railway

### Prompt a probar
\`Eres un sistema de deduplicación para ayuda post-terremoto en Venezuela. Analiza si el REPORTE NUEVO es duplicado de alguno de los REPORTES EXISTENTES. Criterios: categoría igual (40%), descripción similar (35%), distancia menor a 500m (25%). Responde SOLO en JSON: {es_duplicado: true/false, similitud: 0-100, reporte_similar_id: uuid o null, motivo: texto breve}\`

### Criterio de aceptación
El prompt con 2 reportes similares (mismo barrio, mismo tipo de daño) devuelve es_duplicado: true con similitud > 80." \
  --label "semana-2,ia,backend"

gh issue create \
  --repo $REPO \
  --title "[S2-D8] Frontend: Configurar Service Worker offline con Workbox" \
  --body "## Día 8 · Lunes · Semana 2

### Tareas
- [ ] Instalar next-pwa: \`npm install next-pwa\`
- [ ] Configurar Service Worker en next.config.js
- [ ] Caché offline de los tiles del mapa de Venezuela (Caracas, Miranda, La Guaira)
- [ ] Banner no bloqueante 'Sin conexión' cuando el device está offline
- [ ] Verificar que el mapa carga sin internet después de la primera visita

### Criterio de aceptación
Con modo avión activado, el mapa de Venezuela se ve con los reportes ya cacheados." \
  --label "semana-2,frontend"

gh issue create \
  --repo $REPO \
  --title "[S2-D9] IA: Implementar servicio de deduplicación con Gemini" \
  --body "## Día 9 · Martes · Semana 2

### Tareas
- [ ] Implementar \`services/deduplicacion.py\` con la función \`verificar_duplicado()\`
- [ ] Implementar \`get_reportes_cercanos()\` usando PostGIS — radio 500 metros, misma categoría
- [ ] Crear función SQL \`reportes_cercanos()\` en Supabase SQL Editor
- [ ] Si Gemini falla → retornar {es_duplicado: false} y loggear el error (nunca bloquear la creación)
- [ ] Umbral de similitud: solo marcar como duplicado si similitud >= 80

### Criterio de aceptación
Dos reportes de 'techo' creados a 100 metros de distancia son detectados como duplicados. Si la API de Gemini está caída, el reporte se crea igual sin deduplicar." \
  --label "semana-2,ia,backend,critico"

gh issue create \
  --repo $REPO \
  --title "[S2-D9] Frontend: IndexedDB para reportes pendientes offline" \
  --body "## Día 9 · Martes · Semana 2

### Tareas
- [ ] Implementar \`lib/offline.ts\` con funciones: saveOffline(), getPendientes(), clearPendientes()
- [ ] Usar IndexedDB para guardar reportes pendientes sin señal
- [ ] Función getDeviceId() — genera y persiste un UUID anónimo en localStorage
- [ ] Cuando no hay conexión, el formulario guarda localmente y muestra 'Guardado — se enviará cuando vuelva la señal'

### Criterio de aceptación
Crear un reporte con modo avión activo lo guarda en IndexedDB. Al reconectar, aparece en el mapa automáticamente." \
  --label "semana-2,frontend"

gh issue create \
  --repo $REPO \
  --title "[S2-D10] IA: Integrar deduplicación en POST /api/reportes" \
  --body "## Día 10 · Miércoles · Semana 2

### Tareas
- [ ] Llamar a verificar_duplicado() dentro de POST /api/reportes antes de insertar
- [ ] Si es_duplicado: true → asignar grupo_duplicado al ID del reporte similar
- [ ] El mapa debe mostrar 1 punto con indicador '3 reportes similares en esta zona' en vez de 3 puntos separados
- [ ] La respuesta del endpoint incluye es_duplicado, similitud y mensaje correspondiente

### Criterio de aceptación
Crear 3 reportes de 'agua' en el mismo barrio resulta en 1 punto en el mapa con el indicador de reportes agrupados." \
  --label "semana-2,ia,backend"

gh issue create \
  --repo $REPO \
  --title "[S2-D10] Frontend: Pantalla de lista con filtros por categoría" \
  --body "## Día 10 · Miércoles · Semana 2

### Tareas
- [ ] Pantalla de lista — tarjetas con borde izquierdo del color de la categoría
- [ ] Cada tarjeta muestra: categoría + ícono, descripción, zona, tiempo relativo, número de confirmaciones
- [ ] Pills de filtro horizontal en la parte superior: Todas / Vivienda / Agua / Eléctrico / Salud / Negocio / Carpintería
- [ ] Tocar una tarjeta navega a la pantalla de detalle
- [ ] Ordenadas por created_at descendente (más recientes primero)

### Criterio de aceptación
La lista muestra todos los reportes, se filtra correctamente al tocar una categoría, y navega al detalle." \
  --label "semana-2,frontend"

gh issue create \
  --repo $REPO \
  --title "[S2-D12] Fotos: Configurar Cloudinary y subida desde el formulario" \
  --body "## Día 12 · Viernes · Semana 2

### Tareas — Backend (Tu hijo)
- [ ] Crear cuenta en Cloudinary (gratuito: 25GB)
- [ ] Configurar upload preset público para subida directa desde el frontend
- [ ] No es necesario código en el backend — Cloudinary recibe la foto directo del frontend

### Tareas — Frontend (Tu amigo)
- [ ] Botón de foto en el formulario — abre cámara o galería del teléfono
- [ ] Subida directa a Cloudinary usando el upload preset
- [ ] Mostrar preview de la foto antes de publicar el reporte
- [ ] Guardar la URL de Cloudinary en el campo foto_url del reporte
- [ ] Mostrar la foto en la pantalla de detalle si existe

### Criterio de aceptación
Tomar una foto desde el formulario, crear el reporte y que la foto aparezca en la pantalla de detalle." \
  --label "semana-2,backend,frontend"

gh issue create \
  --repo $REPO \
  --title "[S2-D14] Meta de Semana 2 — Demo offline + IA + PWA instalable" \
  --body "## Día 14 · Domingo · Semana 2

### Pruebas obligatorias
- [ ] Crear reporte sin señal → reconectar → verificar que aparece en el mapa y en Supabase
- [ ] Crear 2 reportes similares (mismo barrio, misma categoría) → verificar que la IA los agrupa en 1 punto
- [ ] Verificar que si Gemini API falla, el reporte se crea igual sin deduplicar
- [ ] Instalar la PWA en un Android real (Chrome → 'Agregar a pantalla de inicio')
- [ ] La app instalada funciona offline correctamente

### ✅ Definition of Done — Semana 2
- [ ] Se puede crear un reporte sin señal y aparece al reconectar
- [ ] La IA agrupa 2 reportes similares en el mismo punto del mapa
- [ ] Si Gemini falla, el reporte se crea igual sin deduplicación
- [ ] La vista lista funciona con filtros por categoría
- [ ] Las fotos se suben a Cloudinary y se muestran en el detalle
- [ ] La app es instalable como PWA desde Chrome Android

### Entregable
Video de 30 segundos: crear reporte en modo avión → reconectar → aparecer en mapa. Compartir en el grupo del proyecto." \
  --label "semana-2,critico,definition-of-done"

echo "✅ Semana 2 creada (8 issues)"
echo ""
echo "📋 Creando Issues — Semana 3..."

# ── SEMANA 3 ─────────────────────────────────────────────────

gh issue create \
  --repo $REPO \
  --title "[S3-D15] Sesión conjunta de bugs — prueba en condiciones reales" \
  --body "## Día 15 · Lunes · Semana 3

### Tareas — Todo el equipo
- [ ] Sesión de 1 hora de prueba intensiva del flujo completo
- [ ] Probar específicamente en señal débil (modo 3G o señal reducida)
- [ ] Cada bug encontrado se abre como Issue separado en GitHub inmediatamente
- [ ] Al final de la sesión: lista de bugs priorizada (crítico / medio / bajo)

### Flujo completo a probar
1. Abrir la app desde la URL de Vercel en Chrome Android
2. Ver el mapa con reportes reales
3. Tocar un marcador → ver detalle
4. Crear un reporte nuevo (con foto)
5. Confirmar 'todavía se necesita' en un reporte existente
6. Repetir en modo avión y verificar sincronización

### Criterio de aceptación
Lista de bugs documentada como Issues en GitHub, priorizada y asignada." \
  --label "semana-3,critico"

gh issue create \
  --repo $REPO \
  --title "[S3-D17] Cargar los 20 reportes reales iniciales pre-lanzamiento" \
  --body "## Día 17 · Miércoles · Semana 3

### Contexto
No lanzar con el mapa vacío. Los 20 reportes iniciales garantizan que el primer usuario que abra la app ve contenido real inmediatamente.

### Tareas
- [ ] Recopilar 20 necesidades reales de zonas afectadas (Caracas, La Guaira, Miranda)
- [ ] Distribuir entre las 6 categorías: mínimo 3 por categoría
- [ ] Incluir coordenadas GPS reales de los lugares reportados
- [ ] Usar descripciones específicas y reales — no genéricas
- [ ] Insertar en Supabase y verificar que aparecen correctamente en el mapa

### Distribución sugerida
- 5 reportes de Vivienda (techo)
- 4 reportes de Agua
- 4 reportes de Eléctrico
- 3 reportes de Salud/Escuelas
- 2 reportes de Negocio
- 2 reportes de Carpintería

### Criterio de aceptación
20 reportes reales visibles en el mapa con coordenadas correctas, distribuidos geográficamente en zonas afectadas." \
  --label "semana-3,coordinacion,critico"

gh issue create \
  --repo $REPO \
  --title "[S3-D18] Seguridad: Rate limiting y validación de inputs" \
  --body "## Día 18 · Jueves · Semana 3

### Tareas — Backend
- [ ] Rate limiting: máximo 5 reportes por device_id por hora
- [ ] Validar que la descripción no supere 300 caracteres
- [ ] Validar que las coordenadas son geográficamente válidas para Venezuela (lat: 0.6-12.2, lng: -73.4 a -59.8)
- [ ] Validar que la categoría sea uno de los 6 valores del ENUM
- [ ] Retornar mensajes de error claros al frontend (no errores 500 genéricos)

### Tareas — Frontend
- [ ] Contador de caracteres en la descripción (300 máx)
- [ ] Mensaje de error visible cuando algo falla — no silencioso
- [ ] Pantalla 'Cómo funciona' — guía de 3 pasos para usuarios nuevos

### Criterio de aceptación
Intentar crear un 6to reporte en la misma hora retorna error 429. Las coordenadas fuera de Venezuela retornan error 400." \
  --label "semana-3,backend,frontend"

gh issue create \
  --repo $REPO \
  --title "[S3-D19] Coordinación: Contactar a De Mano En Mano y preparar testers" \
  --body "## Día 19 · Viernes · Semana 3

### Tareas
- [ ] Enviar mensaje a De Mano En Mano por Instagram: presentar el proyecto como complementario (fase de reconstrucción vs emergencia inmediata)
- [ ] Identificar y confirmar 5 testers con teléfonos Android en Venezuela
- [ ] Al menos 2 testers deben estar en zonas directamente afectadas por el terremoto
- [ ] Redactar el mensaje de WhatsApp del lanzamiento controlado (semana 4)
- [ ] Verificar que la URL de Vercel funciona correctamente en un teléfono Android nunca visto antes

### Mensaje para De Mano En Mano
'Hola, vimos De Mano En Mano y nos parece uno de los proyectos más bien pensados post-terremoto — especialmente la decisión de no intermediar dinero. Somos un equipo pequeño construyendo algo complementario: una plataforma para la fase de reconstrucción a largo plazo. Mismo modelo de confianza que el de ustedes. ¿Estarían abiertos a una conversación corta?'

### Criterio de aceptación
Mensaje enviado a De Mano En Mano. Lista de 5 testers confirmados con nombre y número de WhatsApp." \
  --label "semana-3,coordinacion,critico"

gh issue create \
  --repo $REPO \
  --title "[S3-D20] Prueba en 3 dispositivos Android distintos" \
  --body "## Día 20 · Sábado · Semana 3

### Dispositivos objetivo (los más comunes en Venezuela)
- [ ] Samsung Galaxy (cualquier modelo A o J)
- [ ] Xiaomi Redmi (cualquier modelo)
- [ ] Motorola Moto G (cualquier modelo)

### Qué verificar en cada dispositivo
- [ ] El mapa carga en menos de 3 segundos en WiFi
- [ ] El mapa carga en menos de 5 segundos en datos móviles
- [ ] La app es instalable como PWA desde Chrome
- [ ] El GPS funciona correctamente para ubicar al usuario
- [ ] Las fotos se suben y se ven correctamente
- [ ] Los botones tienen tamaño suficiente para tocar fácilmente (≥ 44px)

### Criterio de aceptación
La app funciona sin bugs críticos en los 3 dispositivos. Documentar cualquier diferencia de comportamiento entre dispositivos." \
  --label "semana-3,critico,definition-of-done"

echo "✅ Semana 3 creada (5 issues)"
echo ""
echo "📋 Creando Issues — Semana 4..."

# ── SEMANA 4 ─────────────────────────────────────────────────

gh issue create \
  --repo $REPO \
  --title "[S4-D22] Lanzamiento: Configurar monitoreo y enviar a testers" \
  --body "## Día 22 · Lunes · Semana 4

### Tareas — Backend
- [ ] Configurar logs básicos en Railway — ver errores en tiempo real
- [ ] Dashboard simple en Supabase — contar reportes por categoría y estado
- [ ] Verificar que todos los endpoints responden correctamente en producción

### Tareas — Coordinación
- [ ] ✅ Enviar enlace de la PWA a los 5 testers por WhatsApp
- [ ] Mensaje exacto: 'Abre este enlace en Chrome Android → toca Instalar → crea un reporte → cuéntame qué te pareció'
- [ ] Monitorear Supabase en tiempo real durante las primeras 4 horas

### Criterio de aceptación
Los 5 testers recibieron el mensaje y al menos 3 confirmaron que abrieron la app." \
  --label "semana-4,coordinacion,critico"

gh issue create \
  --repo $REPO \
  --title "[S4-D23] Recopilar y priorizar feedback de los 5 testers" \
  --body "## Día 23 · Martes · Semana 4

### Tareas
- [ ] Llamada o nota de voz de 10-15 min con cada tester
- [ ] Preguntas clave: ¿Qué fue confuso? ¿Qué funcionó bien? ¿Compartirías esto con alguien? ¿Con quién?
- [ ] Documentar los 3 problemas más mencionados como Issues de alta prioridad
- [ ] Documentar los 3 aspectos más valorados

### Criterio de aceptación
Feedback de al menos 3 de los 5 testers documentado como Issues en GitHub." \
  --label "semana-4,coordinacion"

gh issue create \
  --repo $REPO \
  --title "[S4-D25] Lanzamiento WhatsApp — grupos venezolanos seleccionados" \
  --body "## Día 25 · Jueves · Semana 4

### Pre-requisitos antes de enviar
- [ ] Los bugs críticos del feedback de testers están corregidos
- [ ] El mapa tiene al menos 20 reportes visibles
- [ ] La app carga en menos de 3 segundos en 3G

### Tareas
- [ ] Enviar a 2-3 grupos de WhatsApp de venezolanos seleccionados (no masivo)
- [ ] Mensaje claro: qué es, qué hace, enlace directo, 'compártelo si conoces a alguien que lo necesite'
- [ ] Monitorear Supabase — ¿llegan reportes nuevos de usuarios externos?

### Mensaje de lanzamiento
'🏗️ ReconstruyeVE — Si conoces a alguien en Venezuela que necesita ayuda para reconstruir después del terremoto, esta plataforma conecta familias con voluntarios y donantes directamente. Sin intermediarios. Sin login. Solo entra, reporta tu necesidad y alguien puede ayudarte. [URL] — Compártelo con quien lo necesite 🙏'

### Criterio de aceptación
El mensaje fue enviado. Al menos 1 reporte nuevo de un usuario externo aparece en Supabase." \
  --label "semana-4,coordinacion,critico"

gh issue create \
  --repo $REPO \
  --title "[S4-D28] 🏆 Retrospectiva del Sprint — MVP completado" \
  --body "## Día 28 · Domingo · Semana 4

### Reunión de cierre del Sprint (30 minutos — todo el equipo)

### Agenda
- [ ] ¿Cuántos reportes reales se crearon por usuarios externos?
- [ ] ¿Hubo al menos una conexión real entre quien necesita y quien puede ayudar?
- [ ] ¿Qué fue lo más difícil técnicamente?
- [ ] ¿Qué habríamos hecho diferente?
- [ ] ¿Qué pidieron los usuarios que no está en el MVP?

### ✅ Definition of Done — Sprint completo
- [ ] 5 testers usaron la app y dieron feedback
- [ ] Los 3 bugs más críticos del feedback están corregidos
- [ ] Lanzamiento por WhatsApp realizado
- [ ] Al menos 1 reporte real de usuario externo en Supabase
- [ ] 🏆 Una persona con necesidad conectó con alguien que puede ayudar

### Decisiones para Fase 2
- [ ] Definir las 3 funcionalidades más pedidas por usuarios reales
- [ ] Decidir si contactar a @campoconwifi (TeBusco) con el prototipo funcionando
- [ ] Evaluar si De Mano En Mano respondió y qué colaboración es posible

### Celebración
28 días · 3 personas part-time · $0 de infraestructura · Un producto real en producción ayudando a familias venezolanas. 🇻🇪" \
  --label "semana-4,critico,definition-of-done"

echo "✅ Semana 4 creada (4 issues)"
echo ""
echo "============================================"
echo "🎉 Sprint completo creado en GitHub"
echo "   Total: 30 Issues en 4 Semanas"
echo "   Repo: https://github.com/fireflameblaze/ReconstruyeVE/issues"
echo "============================================"
