# Navegación en 3 Pantallas — Flutter

Aplicación desarrollada en Flutter que implementa navegación entre tres pantallas usando el widget `Navigator`.

---

## Descripción del proyecto

Este proyecto corresponde a la **Tarea 3** del curso de desarrollo móvil. El objetivo es demostrar el manejo de navegación entre pantallas en Flutter mediante `Navigator.push()` y `Navigator.pop()`, cumpliendo con los siguientes requerimientos:

| Requerimiento | Implementado |
|---|---|
| 3 pantallas con `Scaffold` y título visible | ✅ |
| Pantalla 1 → botón para ir a Pantalla 2 | ✅ |
| Pantalla 2 → botón para ir a Pantalla 3 y botón para volver | ✅ |
| Pantalla 3 → botón para regresar | ✅ |
| Uso de `Navigator.push()` | ✅ |
| Uso de `Navigator.pop()` | ✅ |

---

## Pantallas

### Pantalla 1 — Inicio
- Muestra un campo de texto para ingresar el nombre del usuario.
- Botón **"Ir a Pantalla 2"** que avanza usando `Navigator.push()`.
- El nombre ingresado se pasa como parámetro a las siguientes pantallas.

### Pantalla 2 — En camino
- Muestra el nombre del usuario recibido desde Pantalla 1.
- Botón **"Ir a Pantalla 3"** → `Navigator.push()`.
- Botón **"Volver a Pantalla 1"** → `Navigator.pop()`.

### Pantalla 3 — Destino
- Confirma que el usuario completó el flujo de navegación.
- Botón **"Regresar a Pantalla 2"** → `Navigator.pop()`.
- Botón **"Ir al Inicio"** → `Navigator.popUntil()` para limpiar todo el stack y volver directo a Pantalla 1.

---

## Funcionalidades extra implementadas

- **Transición animada** — Animación slide horizontal personalizada con `PageRouteBuilder` entre pantallas.
- **Indicador de pasos** — Barra visual animada que muestra en qué pantalla se encuentra el usuario (paso 1/2/3).
- **Paso de datos** — El nombre ingresado en Pantalla 1 se muestra en Pantalla 2 y 3.
- **`Navigator.popUntil()`** — Retorno directo al inicio desde cualquier pantalla del stack.
- **UI con gradientes** — Cada pantalla tiene su propia paleta de colores y header con degradado.

---

## Navegación implementada

```
Pantalla 1
    │
    │  Navigator.push()
    ▼
Pantalla 2
    │                   │
    │  Navigator.push() │  Navigator.pop()
    ▼                   │
Pantalla 3          ◄───┘
    │
    │  Navigator.pop()          → regresa a Pantalla 2
    │  Navigator.popUntil()     → regresa directo a Pantalla 1
```

---

## Estructura del proyecto

```
lib/
└── main.dart        # Toda la lógica: MyApp, Pantalla1, Pantalla2, Pantalla3,
                     # IndicadorPasos, _PantallaHeader, _slideRoute
```

---

## Cómo ejecutar

**Requisitos:** Flutter SDK instalado.

```bash
# Clonar el repositorio
git clone https://github.com/luisfernandoAngulo28/Navegaci-n-en-3-pantallas.git

# Entrar al proyecto
cd Navegaci-n-en-3-pantallas

# Instalar dependencias
flutter pub get

# Ejecutar la app
flutter run
```

---

## Tecnologías

- **Flutter** — Framework UI multiplataforma
- **Dart** — Lenguaje de programación
- **Material Design 3** — Sistema de diseño

---

## Autor

**Luis Fernando Angulo**
Curso de Desarrollo de Aplicaciones Móviles
