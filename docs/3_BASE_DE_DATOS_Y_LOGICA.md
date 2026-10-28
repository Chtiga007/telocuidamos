# TeLoCuidamos.com — Estructura de Base de Datos (PostgreSQL / Supabase)

## 1. Tablas Principales

### `tutores` (Usuarios)
```sql
CREATE TABLE tutores (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    telefono_whatsapp VARCHAR(25) NOT NULL,
    direccion_calle VARCHAR(200) NOT NULL,
    barrio_localidad VARCHAR(100) NOT NULL, -- Ej: Palermo, Belgrano, Olivos
    ciudad VARCHAR(50) DEFAULT 'CABA/AMBA',
    mercado_pago_customer_id VARCHAR(100),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

### `mascotas`
```sql
CREATE TABLE mascotas (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    tutor_id UUID REFERENCES tutores(id) ON DELETE CASCADE,
    nombre VARCHAR(50) NOT NULL,
    especie VARCHAR(10) NOT NULL CHECK (especie IN ('perro', 'gato')),
    raza VARCHAR(100),
    fecha_nacimiento DATE,
    peso_actual NUMERIC(4, 2) NOT NULL, -- en kg (ej: 14.50)
    esta_castrado BOOLEAN DEFAULT FALSE,
    foto_url TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

### `planes_alimento` (Consumo y Reposición)
```sql
CREATE TABLE planes_alimento (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    mascota_id UUID REFERENCES mascotas(id) ON DELETE CASCADE,
    marca_alimento VARCHAR(100) NOT NULL, -- Ej: Royal Canin Maxi Adult
    tamano_bolsa_kg NUMERIC(4, 2) NOT NULL, -- Ej: 15.00
    racion_diaria_gramos INTEGER NOT NULL, -- Calculada según peso (ej: 320g)
    dias_duracion_estimada INTEGER GENERATED ALWAYS AS (ROUND((tamano_bolsa_kg * 1000) / racion_diaria_gramos)) STORED,
    fecha_inicio DATE NOT NULL,
    fecha_proxima_reposicion DATE NOT NULL,
    estado_suscripcion VARCHAR(20) DEFAULT 'activa' -- activa, pausada, cancelada
);
```

### `calendario_sanitario` (Vacunas y Desparasitaciones)
```sql
CREATE TABLE calendario_sanitario (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    mascota_id UUID REFERENCES mascotas(id) ON DELETE CASCADE,
    tipo_evento VARCHAR(50) NOT NULL, -- 'Sextuple', 'Antirrabica', 'Antiparasitario', 'Pipeta'
    fecha_programada DATE NOT NULL,
    fecha_realizada DATE,
    estado VARCHAR(20) DEFAULT 'pendiente', -- 'pendiente', 'notificado', 'completado'
    veterinaria_id UUID
);
```

---

## 2. Lógica del Motor de Consumo (Cálculo de Ración Diaria)
Para perros:
* Peso < 5 kg (Mini): ~90g a 120g/día
* Peso 5 - 10 kg (Chico): ~150g a 200g/día
* Peso 11 - 25 kg (Mediano): ~250g a 350g/día
* Peso 26 - 45 kg (Grande): ~400g a 550g/día

$$\text{Días de Bolsa} = \frac{\text{Kilos de Bolsa} \times 1000}{\text{Ración Diaria (g)}}$$

Si la bolsa dura 45 días, el sistema agenda la alerta de WhatsApp para el **día 41** (4 días antes).
