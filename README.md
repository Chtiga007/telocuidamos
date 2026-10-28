# 🐾 TeLoCuidamos.com — Carpeta de Proyecto
**Ubicación:** Escritorio / Te Lo Cuidamos  
**Región de Operación:** Lanús y Avellaneda (Zona Sur, Buenos Aires, Argentina)

Bienvenido a la carpeta principal de **TeLoCuidamos.com**. Aquí tienes todos los recursos organizados y listos para ejecutar.

---

## 🚀 Cómo probar la Web interactiva ahora mismo
1. Hacé doble clic en el archivo **`Abrir_TeLoCuidamos.bat`** (o abrí directamente `app/index.html`).
2. Se abrirá la web en tu navegador:
   * Probá registrar una mascota (Paso 1: tus datos, Paso 2: perro o gato, Paso 3: alimento).
   * Al hacer clic en **"Activar Ficha y Simplificarme el Cuidado"**, verás el Pasaporte Digital con el historial de vacunas, peso y turnos.
   * Probá la navegación móvil, el menú hamburguesa responsivo y la página interna de proveedores (`app/proveedores.html`).

---

## 🌐 Optimización SEO, GEO & LLM (Búsqueda Tradicional, Local e Inteligencia Artificial)
El proyecto cuenta con una arquitectura optimizada para posicionamiento en motores de búsqueda, búsqueda local y síntesis por modelos de lenguaje:
- **SEO Tradicional:** Meta tags enriquecidos (`description`, `keywords`, `canonical`, `robots`), Open Graph y Twitter Cards con imágenes optimizadas.
- **GEO (Geotargeting Hiperlocal):** Georreferenciación precisa (`geo.region`, `geo.placename`, `geo.position`, `ICBM`) con coordenadas para Lanús y Avellaneda, más marcado Schema.org de cobertura barrial (`Lanús Oeste`, `Lanús Este`, `Remedios de Escalada`, `Avellaneda Centro`, `Wilde`, `Gerli`, `Valentín Alsina`, `Sarandí`).
- **LLM / GEO / AEO (AI Engines - Perplexity, ChatGPT, Gemini, Claude, SearchGPT):**
  - Implementación del estándar **`llms.txt`** y **`/.well-known/llms.txt`** con hechos estructurados del servicio, radio barrial y respuestas canónicas.
  - Esquema **`FAQPage`** en JSON-LD para citas directas en Google AI Overviews y motores generativos.
  - **`robots.txt`** con acceso explícito a rastreadores de IA (`GPTBot`, `PerplexityBot`, `ClaudeBot`, `Google-Extended`, `Applebot`).
  - **`sitemap.xml`** con índices de frescura y prioridad para todas las páginas del portal.

---

## 📁 Estructura de Carpetas

```
Te Lo Cuidamos/
├── Abrir_TeLoCuidamos.bat          <-- Lanzador rápido para abrir la web
├── README.md                       <-- Este archivo
├── robots.txt                      <-- Directivas para buscadores y rastreadores de IA
├── sitemap.xml                     <-- Índice XML del sitio para motores de búsqueda
├── llms.txt                        <-- Estándar de conocimiento para LLMs y agentes de IA
├── .well-known/
│   └── llms.txt                    <-- Descubrimiento canónico /.well-known/llms.txt
├── app/
│   ├── index.html                  <-- Portal de Tutores con SEO, GEO, Schema JSON-LD y diseño responsive
│   ├── proveedores.html            <-- Portal B2B de Proveedores y Prestadores Barriales
│   ├── robots.txt
│   ├── sitemap.xml
│   └── llms.txt
├── assets/                         <-- Logos, íconos 3D Pixar, badges oficiales y recortes transparentes
└── docs/                           <-- Planes de negocio, guiones WhatsApp y especificaciones
```
