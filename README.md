# Sistema de ventas con C#

Sistema de gestión de ventas desarrollado en C# utilizando Windows Forms y .NET Framework 4.7.2.
La aplicación sigue una arquitectura en capas, separando las responsabilidades en diferentes
proyectos dentro de la solución.

---

## 🧱 Estructura del Proyecto

La solución esta compuesta por los siguientes proyectos:

- **EntityLayer:** Contiene la clases que representan las entidades del dominio.
- **DataLayer:** Maneja el acceso a datos y la interacción con la base de datos.
- **BuesinessLayer:** Implementa la lógica de negocio de la aplicación.
- **PresentationLayer:** Interfaz de usuario desarrollada con Windows Forms.

---

## 🚀 Características

- Registro y gestión de productos y clientes.
- Registro de ventas.

---

## 🛠️ Requisitos

- **Sistema operativo:** Windows 10 o superior.
- **IDE:** Visual Studio 2022.
- **Framework:** .NET Framework 4.7.2.
- **Base de datos:** SQL Server 2022.

---

## ⚙️ Configuración del Proyecto

### 1. **Clonar el repositorio:**   
```bash
git clone https://github.com/Johao-dev/sale-system-with-csharp.git
```

### 2. **Abrir la solución:**
- Navega a la carpeta del proyecto.
- Abre el archivo `slnTrabajoFinal.sln` con Visual Studio.
     
### 3. **Configurar la cadena de conexión:**
- En el proyecto `DataLayer`, localiza el archivo `Connection.cs`.
- Modifica la cadena conexión para apuntar a tu instancia de SQL Server.

Está es una imagen del modelo de la base de datos:
![Imagen del modelo de la base de datos](/img/modelo_bd.png "Modelo de la base de datos")

Como paso previo, te recomiendo crear la base de datos ejecutando el
archivo `database.sql` en tu instancia de SQL Server.
  
### 4. **Compilar y ejecutar:**
- Establece `PresentationLayer` como proyecto de inicio.
- Presiona `F5` para compilar y ejecutar la aplicación.

---

## 📂 Estructura de Carpetas

~~~
sale-system-with-csharp/
├── EntityLayer/
├── DataLayer/
├── BusinessLayer/
├── PresentationLayer/
├── slnTrabajoFinal.sln
└── README.md
~~~
