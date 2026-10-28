# TeLoCuidamos.com — Automatización y Guiones de WhatsApp
**Canal Oficial:** WhatsApp Cloud API (Meta)  
**Tono:** Cercano, cálido, voseo argentino, eficiente.

---

## 1. Arquitectura Técnica de WhatsApp

1. **Disparador:** La base de datos (PostgreSQL/Supabase) ejecuta un chequeo diario a las 09:00 hs.
2. **Plantilla Oficial:** Se envía un mensaje de plantilla pre-aprobada por Meta con botones interactivos.
3. **Webhook:** Cuando el cliente presiona un botón o escribe, el webhook recibe el evento y actualiza la base de datos automáticamente.

---

## 2. Guiones Oficiales y Flujos de Conversación

### Flujo 1: Bienvenida e Identificación de Mascota
* **Momento:** Inmediatamente tras completar el formulario web.
* **Mensaje:**
> *"¡Hola {{nombre_tutor}}! 👋 Te damos la bienvenida a **TeLoCuidamos.com**.  
> Ya dejamos la ficha de **{{nombre_mascota}}** en piloto automático.  
>  
> Desde este chat te avisaremos antes de que se termine su comida, te recordaremos sus vacunas y coordinaremos turnos con veterinarias de tu zona en CABA/AMBA.  
>  
> Agendanos como el **Asistente de {{nombre_mascota}}** 🐾"*

---

### Flujo 2: Chequeo Mensual de Peso y Ración
* **Momento:** Día 1 de cada mes.
* **Mensaje:**
> *"Hola {{nombre_tutor}}, arrancamos el mes y toca el control de peso de **{{nombre_mascota}}** ⚖️  
> El mes pasado registró **{{peso_anterior}} kg**.  
>  
> ¿Cómo está hoy? Respondé con el número actual (ej: `15.2`) o elegí una opción:"*  
> 🔘 `[ Sigue igual ({{peso_anterior}} kg) ]`  
> 🔘 `[ Cambió de peso ]`  
> 🔘 `[ Tuvo una consulta veterinaria ]`  
* **Lógica posterior:** Al recibir el peso nuevo, el sistema recalcula la ración en gramos por día (`peso_actual * factor_actividad`).

---

### Flujo 3: Reposición Predictiva de Alimento
* **Momento:** 4 días antes de que la bolsa se termine según consumo calculado.
* **Mensaje:**
> *"Hola {{nombre_tutor}}, según la ración de **{{nombre_mascota}}**, le quedan aprox. **4 días** de su bolsa de **{{marca_alimento}} ({{kilos}} kg)** 🥣  
>  
> Tu entrega automática está agendada para el **{{dia_entrega}}** en tu dirección de **{{barrio_direccion}}**.  
>  
> ¿Está todo bien para despachar?"*  
> 🔘 `[ ¡Confirmar entrega! ]`  
> 🔘 `[ Cambiar fecha / horario ]`  
> 🔘 [ Aún me queda comida ]`  
* **Acción si confirma:** Cobro automático vía Mercado Pago Token y generación de orden de despacho para la distribuidora.

---

### Flujo 4: Vencimiento de Vacuna y Turno Cercano
* **Momento:** 12 días antes de la fecha de vencimiento anual.
* **Mensaje:**
> *"{{nombre_tutor}}, el {{fecha_vencimiento}} vence la vacuna **{{tipo_vacuna}}** de **{{nombre_mascota}}** 🩺  
>  
> Tenemos cupos reservados en tu veterinaria de cercanía:  
> 📍 **{{nombre_veterinaria_barrio}}**  
>  
> ¿Te reservamos un turno para este fin de semana?"*  
> 🔘 `[ Sábado por la mañana ]`  
> 🔘 `[ Sábado por la tarde ]`  
> 🔘 `[ Coordinar otro día ]`  
* **Acción si elige horario:** Envío automático de notificación a la veterinaria para agendarlo y confirmación con dirección al tutor.
