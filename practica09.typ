#set text(font: "Helvetica Neue")
#set page(
  paper: "us-letter",
  margin: 2.5cm,
)
#set align(center)

// === Definición de logos ===
#let logo-ipn = image("media/logos/IPN_Logo.pdf", width: 2.2cm)
#let logo-upiicsa = image("media/logos/UPIICSA_Logo.pdf", width: 3cm)

// === Cabecera con logos ===
#grid(
  columns: (1fr, 1fr),
  [
    #align(left)[#logo-ipn]
  ],
  [
    #align(right)[#logo-upiicsa]
  ],
)

// Espacio más pequeño entre logos y texto principal
//#v(4pt)

// === Contenido central (centrado visualmente en la página) ===
#block[
  #v(1.5cm)
  #text(14pt, weight: "bold")[INSTITUTO POLITÉCNICO NACIONAL]
  #v(0.4cm)
  #text(13pt, weight: "bold")[UNIDAD PROFESIONAL INTERDISCIPLINARIA DE INGENIERÍA Y CIENCIAS SOCIALES Y ADMINISTRATIVAS]

  #v(0.9cm)
  #text(11pt)[CARRERA]
  #v(0.2cm)
  #text(12pt, weight: "bold")[Ingeniería en Informática]

  #v(0.5cm)
  #text(11pt)[MATERIA]
  #v(0.2cm)
  #text(12pt, weight: "bold")[Fundamentos de Inteligencia Artificial]

  #v(0.5cm)
  #text(11pt)[PRÁCTICA 9]
  #v(0.2cm)
  #text(12pt, weight: "bold")[Sistema Experto Médico]

  #v(0.5cm)
  #text(11pt)[SECUENCIA]
  #v(0.2cm)
  #text(12pt, weight: "bold")[5NM52]

  #v(0.5cm)
  #text(11pt)[ALUMNO]
  #v(0.2cm)
  #text(12pt, weight: "bold")[Gonzalez Calzada Maximiliano]

  #v(0.5cm)
  #text(11pt)[PROFESOR]
  #v(0.2cm)
  #text(12pt, weight: "bold")[Gonzalez Arroyo Lilia]

  #v(0.5cm)
  #text(11pt)[FECHA DE ENTREGA]
  #v(0.2cm)
  #text(12pt, weight: "bold")[04 - 11 - 2025]
]

// === CONFIGURACIÓN GENERAL DEL DOCUMENTO ===
#set page(
  paper: "us-letter",
  margin: 2.5cm,
)

#set text(
  font: "Helvetica Neue",
  size: 11pt,
  line-spacing: 1.4em,
  justify: true,
)

#set align(left)

// === Encabezados ===
#set heading(numbering: "1.1.a")

#show heading.where(level: 1): set text(size: 13pt, weight: "bold")
#show heading.where(level: 2): set text(size: 12pt, weight: "semibold")
#show heading.where(level: 3): set text(size: 11pt, weight: "medium")

// === Listas ===
//#show list.item: set text(leading: 1.3em)

// === Bloques de código ===
#show raw: block[
  fill: luma(240), // gris claro de fondo
  inset: 0.4em,
  radius: 4pt,
  stroke: none,
  text(font: "Menlo", size: 9pt),
]

// === Párrafos y separación ===
#show par: set par(spacing: 0.5em)

= Directivas Dinámicas <directivas-dinámicas>
== Assert <assert>
#figure(
  image(
    "media//ilustraciones/Captura de pantalla 2025-11-04 a la(s) 11.51.08.png", width: 50%,
  ), caption: [
    Ejecución de la directiva: Assert
  ],
)
<fig:Assert>

Se muestra en la figura @fig:Assert en la página

= Sistema Experto Médico <sistema-experto-médico>
== Respuestas a los ejercicios 6–12 <respuestas-a-los-ejercicios-612>
=== 6. Tifoidea <tifoidea>
Síntomas: temperatura alta, falta de apetito, dolor abdominal, dolor de cabeza y diarrea

- Diagnóstico: tifoidea.

- Justificación: estos síntomas coinciden con la entrada conocimiento(’tifoidea’, \[...\]) que contiene: falta de apetito, temperatura alta, dolor abdominal, dolor de cabeza, diarrea.

=== 7. Malaria <malaria>
Síntomas: dolor en las articulaciones, estornudo, temperatura alta, temblor violento y escalofríos

- Diagnóstico: malaria.

- Justificación: la entrada conocimiento(’malaria’, \[...\]) incluye temperatura alta, dolor en las articulaciones, tiembla violentamente, escalofríos, que coincide con los síntomas dados.

=== 8. Influenza <influenza>
Síntomas: dolor de cabeza, estornudos y dolor en las articulaciones

- Diagnóstico: influenza.

- Justificación: la entrada conocimiento(’influenza’, \[...\]) contiene dolor en las articulaciones, mucho estornudo, dolor de cabeza (tiene las tres).

=== 9. Nada <nada>
Síntomas: temperatura alta, escalofríos, dolor de cabeza y diarrea; temperatura alta, escalofríos, dolor de cabeza y diarrea

- Diagnóstico: No hay suficiente conocimiento / Ninguno (ninguna entrada de la base tiene exactamente ese conjunto completo).

- Justificación:

  - tifoidea tiene temperatura alta, dolor de cabeza, diarrea pero además requiere falta de apetito y dolor abdominal (no están en la lista del paciente).

  - malaria tiene temperatura alta y escalofríos pero además requiere dolor en las articulaciones y temblor violento (no están).

  Por tanto, ningún diagnóstico en la base coincide con todos los síntomas proporcionados.

=== 10. Síntomas para que el sistema determine sarampión: <síntomas-para-que-el-sistema-determine-sarampión>
dolor de cabeza, estornudos y dolor en las articulaciones

\[’el paciente esta cubierto de puntos’, ’el paciente tiene temperatura alta’, ’el paciente tiene ojos rojos’, ’el paciente tiene tos seca’\]. (Exactamente los de conocimiento(’sarampion’, ...)).

=== 11. Síntomas para que el sistema determine la gripe: <síntomas-para-que-el-sistema-determine-la-gripe>
\[’el paciente tiene cuerpo cortado’, ’el paciente tiene dolor de cabeza’, ’el paciente tiene temperatura alta’\] (corrigiendo la ortografía de temperatura si quieres).

=== 12. Agregar COVID a la base de conocimientos (síntomas dados): <agregar-covid-a-la-base-de-conocimientos-síntomas-dados>
Añadimos esta regla a BaseConocimientos1.pl:

```js
conocimiento('covid',
  ['el paciente tiene fiebre',
   'el paciente tiene tos seca',
   'el paciente tiene perdida de olfato',
   'el paciente tiene cansancio',
   'el paciente tiene dolores musculares']).
```

== Archivo BaseConocimientos1.pl (versión con COVID incluida) <archivo-baseconocimientos1.pl-versión-con-covid-incluida>
Añadimos lo siguiente en BaseConocimientos1.pl:

```js
% BaseConocimientos1.pl
:-style_check(-singleton).  % evita warnings por variables singleton

conocimiento('sarampion',
  ['el paciente esta cubierto de puntos',
   'el paciente tiene temperatura alta',
   'el paciente tiene ojos rojos',
   'el paciente tiene tos seca']).

conocimiento('influenza',
  ['el paciente tiene dolor en las articulaciones',
   'el paciente tiene mucho estornudo',
   'el paciente tiene dolor de cabeza']).

conocimiento('malaria',
  ['el paciente tiene temperatura alta',
   'el paciente tiene dolor en las articulaciones',
   'el paciente tiembla violentamente',
   'el paciente tiene escalofrios']).

conocimiento('gripe',
  ['el paciente tiene cuerpo cortado',
   'el paciente tiene dolor de cabeza',
   'el paciente tiene temperatura alta']).  % nota: 'temparatura' corregido

conocimiento('tifoidea',
  ['el paciente tiene falta de apetito',
   'el paciente tiene temperatura alta',
   'el paciente tiene dolor abdominal',
   'el paciente tiene dolor de cabeza',
   'el paciente tiene diarrea']).

conocimiento('covid',
  ['el paciente tiene fiebre',
   'el paciente tiene tos seca',
   'el paciente tiene perdida de olfato',
   'el paciente tiene cansancio',
   'el paciente tiene dolores musculares']).
```

== Ejecución <ejecución>
#figure(image("media/ilustraciones/covid.png", width: 50%), caption: [
  Ejecución con diagnóstico: Covid
])
<fig:covid>

#figure(image("media/ilustraciones/gripe.png", width: 50%), caption: [
  Ejecución con diagnóstico: Gripe
])
<fig:Gripe>

#figure(image("media/ilustraciones/influenza.png", width: 50%), caption: [
  Ejecución con diagnóstico: Influenza
])
<fig:Influenza>

#figure(image("media/ilustraciones/malaria.png", width: 50%), caption: [
  Ejecución con diagnóstico: Malaria
])
<fig:Malaria>

#figure(image("media/ilustraciones/sarampion.png", width: 50%), caption: [
  Ejecución con diagnóstico: Sarampión
])
<fig:Sarampion>

#figure(image("media/ilustraciones/tifoidea.png", width: 50%), caption: [
  Ejecución con diagnóstico: Tifoidea
])
<fig:Tifoidea>
