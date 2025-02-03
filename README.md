# 📱 Flutter Clean Architecture App

## 📌 Configuración y Ejecución

### ⚙️ Requisitos Previos

- Tener instalado [Flutter](https://flutter.dev/docs/get-started/install) (versión recomendada: 3.6.1 o superior)
- Tener instalado [Dart](https://dart.dev/get-dart)
- Configurar un emulador o conectar un dispositivo físico

### 🚀 Pasos para ejecutar la aplicación

1. Clonar el repositorio:
   ```sh
   git clone https://github.com/camonayc/Technical_Test_ASD.git
   cd Technical_Test_ASD
   ```
2. Instalar las dependencias:
   ```sh
   flutter pub get
   ```
3. Ejecutar la aplicación en un emulador o dispositivo:
   ```sh
   flutter run
   ```

---

## 🏗️ Decisiones Técnicas y Arquitectura

### 🔹 Clean Architecture

La aplicación sigue la arquitectura **Clean Architecture**, asegurando una correcta separación de responsabilidades mediante las siguientes capas:

### 📁 **Estructura del Proyecto**

```
📦 lib/
 ├── core/            # Configuraciones, servicios generales y utils
 ├── modules/         # Features separadas en Data, Domain y Presentation
 │   ├── feature_x/
 │   │   ├── data/        # Manejo de repositorios, modelos y fuentes de datos
 │   │   ├── domain/      # Casos de uso e interfaces
 │   │   ├── presentation/ # UI y lógica de presentación con Bloc
 ├── shared/         # Implementaciones compartidas entre módulos
 ├── main.dart       # Punto de entrada de la aplicación
```

### 🛠️ **Justificación de la arquitectura**

- **Modularidad:** Facilita la escalabilidad y mantenimiento del código.
- **Separación de responsabilidades:**
  - **Core**: Contiene configuraciones generales, servicios como API y utilidades comunes.
  - **Modules**: Cada feature tiene su propia estructura interna con **Data, Domain y Presentation**.
  - **Shared**: Implementaciones compartidas para evitar duplicación de código.
- **Uso de BLoC:**
  - Separa la lógica de negocio de la UI.
  - Facilita la prueba y reutilización del código.
  - Se conecta a los casos de uso definidos en **Domain**.

### 📌 Ejemplo de flujo de datos

1. **Presentation** (UI) -> Envía eventos al **BLoC**
2. **BLoC** -> Llama a un caso de uso en **Domain**
3. **Domain** -> Usa un repositorio definido en **Data**
4. **Data** -> Obtiene los datos desde un API o base de datos local
5. **BLoC** -> Emite un nuevo estado con los datos obtenidos
6. **UI** -> Escucha los cambios de estado y actualiza la vista

## 🧪 Pruebas Unitarias

Para ejecutar las pruebas unitarias en el proyecto, sigue estos pasos:

### ⚙️ Instalación de dependencias

Si es la primera vez que ejecutas las pruebas o si faltan dependencias, instálalas con:

```sh
flutter pub add dev:mockito dev:build_runner
```

### ⚡ Ejecutar pruebas

Para ejecutar todas las pruebas unitarias:

```sh
flutter test
```

Si necesitas regenerar los mocks debido a cambios en las clases de prueba, ejecuta:

```sh
flutter pub run build_runner build
```

### 🔨 Configuración especial

Para evitar `LateInitializationError` en `Environment.config`, asegúrate de inicializarlo antes de correr las pruebas. Agrega esto en los archivos de prueba (`test/...`):

```dart
setUpAll(() async {
  final env = Environment();
  await env.initConfig(env: EnvType.DEV); // Inicializa el entorno antes de los tests
});
```

Esto garantiza que `Environment.config` esté correctamente inicializado antes de las pruebas. ✨
