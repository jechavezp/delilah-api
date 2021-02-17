# Trabajo práctico número 3: Delilah resto

_Este proyecto tiene como objetivo ofrecer una API para ejecutar acciones sobre una DB. Se simula una APP para realizar pedidos de comidas._

### Pre-requisitos

_Instalar Node.js y MYSQL. Opcional: Mysql Workbench o cualquier gestor gráfico de DB para Mysql. Luego de instalar MySql, utilizar el script ubicado en data-model/table-creation.sql para crear la DB y sus tablas. También recuera establecer en el archivo "index.js" los datos de conexión a tu DB local._

### Instalación

_Ubicandose en la raíz del proyecto, ejecutar "npm install" para instalar las dependencias necesarias y luego inicializar la aplicación con "npm run start". También está habilitada la opción de levantar la aplicación con Nodemon: "npm run start-dev". Si deseas saber en detalle las dependencias utilizadas, dale una mirada al archivo package.json._

## URL base

_localhost:9090_

## Probando la API
_A continuación se explica como utilizar los EndPoints. Esto se puede realizar con [postman](https://www.postman.com/) o [insomnia](https://insomnia.rest/). No sobra mencionar que debes ejecutar en orden los pasos 1, 2 y 3. 🔔

## USUARIOS

### 1. Crear un usuario

_Solo se usan estos dos roles:  **admin** | **user**. Todos los campos son obligatorios. Es necesario crear como mínimo dos usuarios para realizar las pruebas: uno con rol "admin" y otro con rol "user"._

_[POST] localhost:9090/user/add_

```
{
        "USER_NAME": "jhon",
        "FULL_NAME": "Jhon Echavez",
        "EMAIL": "algo@algo.com",
        "PHONE_COUNTRY_CODE": "+57",
        "PHONE_NUMBER": "311 222 33 44",
        "ADDRESS": "Calle 10 A sur # 20-356",
        "PASSWORD": "Mypass**",
        "ROLE": "user" 
}
```

### Ejemplo de respuesta exitosa (/user/add)

```
{
        "fieldCount": 0,
        "affectedRows": 1,
        "insertId": 15,
        "info": "",
        "serverStatus": 2,
        "warningStatus": 0
    }
```
### 2. Inicio de sesión

_[POST] localhost:9090/user/login_

```
{
        "USER_NAME": "jhon",
        "EMAIL": "algo@algo.com",
        "PASSWORD": "Mypass**"
    }
```
### Ejemplo de respuesta exitosa (/user/login)

_NOTA: no olvides tomar nota del Token por cada usuario que inicie sesión ya que lo necesitarás más adelante._

```
{
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6MiwiVVNFUl9OQU1FIjoibHV6bWkiLCJFTUFJTCI6Imx1emJvbmlsbGFAZ21haWwuY29tIiwiUk9MRSI6InVzZXIiLCJpYXQiOjE2MTI4MzEyNzV9.7be8tTGIuvb118w9h0YCCdhRzeeXEPPtdNJbwikElQs"
}
```
## PRODUCTOS

### 3. Crear nuevo producto

_Todos los campos son obligatorios. Solo el rol "admin" puede ejecutar esta acción. Por lo tanto, debes usar el respectivo Token._

_[POST] localhost:9090/productos/add_

```
{
        "PRODUCT_NAME": "Fraid Potato", 
        "PRODUCT_PRICE": "8000", 
        "PRODUCT_IMAGE": "https://*.img",
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6MSwiVVNFUl9OQU1FIjoiamhvbmZpIiwiRU1BSUwiOiJqaG9uZmVjaGF2ZXpAZ21haWwuY29tIiwiUk9MRSI6ImFkbWluIiwiaWF0IjoxNjEyODMyNjkxfQ.9I13VAJtf-wHpJHl4L5rPEcDPQerjqf8YXKSd56APgI"
    }
```

## Ejemplo de respuesta exitosa (/productos/add)

```
{
        "fieldCount": 0,
        "affectedRows": 1,
        "insertId": 6,
        "info": "",
        "serverStatus": 2,
        "warningStatus": 0
}
```

### 4. Obtener listado de productos

_[GET] localhost:9090/productos_

## Ejemplo de respuesta exitosa (/productos)

```
[
    {
        "ID": 6,
        "PRODUCT_NAME": "Fraid Potato",
        "PRODUCT_PRICE": 8000,
        "PRODUCT_IMAGE": "https://*.img"
    }
]
```
### 5. Eliminar un producto

_Solo el rol "admin" puede ejecutar esta acción. Por lo tanto, debes usar el respectivo Token. Debes usar "PRODUCT_ID". El producto no podrá ser eliminado si ya esta referenciado en un pedido (por temas de integridad de información)._

_[POST] localhost:9090/productos/remove_

```
{	
	"PRODUCT_ID": "6",	 	 	 		
	"token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6MSwiVVNFUl9OQU1FIjoiamhvbmZpIiwiRU1BSUwiOiJqaG9uZmVjaGF2ZXpAZ21haWwuY29tIiwiUk9MRSI6ImFkbWluIiwiaWF0IjoxNjEyODMyNjkxfQ.9I13VAJtf-wHpJHl4L5rPEcDPQerjqf8YXKSd56APgI"
}
```

## Ejemplo de respuesta exitosa (/productos/remove)

```{
        "fieldCount": 0,
        "affectedRows": 1,
        "insertId": 0,
        "info": "",
        "serverStatus": 34,
        "warningStatus": 0
    }
```

## Ejemplo de respuesta no exitosa (/productos/remove)

```{
  "Error": "no es posible eliminar el producto. Revise la consola para más detalles"
   }
```

### 6. Modificar un producto

_Solo el rol "admin" puede ejecutar esta acción. Por lo tanto, debes usar el respectivo Token. Puedes modificar los campos "PRODUCT_IMAGE", "PRODUCT_PRICE" y "PRODUCT_NAME". Esto solo usando el "ID" del producto._

_[POST] localhost:9090/productos/update_

```
{	
	"PRODUCT_IMAGE": "https://loquesea.com",
	"PRODUCT_PRICE": "7700",
	"PRODUCT_NAME": "French fries",
	"WHERE" : {            
            "ID" : "1"             
        },
"token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6MSwiVVNFUl9OQU1FIjoiamhvbmZpIiwiRU1BSUwiOiJqaG9uZmVjaGF2ZXpAZ21haWwuY29tIiwiUk9MRSI6ImFkbWluIiwiaWF0IjoxNjEyODMyNjkxfQ.9I13VAJtf-wHpJHl4L5rPEcDPQerjqf8YXKSd56APgI"
}
```

## Ejemplo de respuesta no exitosa (/productos/update)

```
{
  "error": "Solo los administradores pueden realizar esta acción"
}
```

## PEDIDOS

### 7. Crear un pedido

_[POST] localhost:9090/order/create_

```{
        "PAGO": "10000",
        "DIRECCION": "Carrera 12 sur A # 26-40",
        "PRODUCTOS": {
            1 : {
                "QNT": 3
            },
            2 : {
                "QNT": 1
            }
        },
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6MiwiVVNFUl9OQU1FIjoibHV6bWkiLCJFTUFJTCI6Imx1emJvbmlsbGFAZ21haWwuY29tIiwiUk9MRSI6InVzZXIiLCJpYXQiOjE2MTI4MzEyNzV9.7be8tTGIuvb118w9h0YCCdhRzeeXEPPtdNJbwikElQs"
    }
```

## Ejemplo de respuesta exitosa (/order/create)

```{
  "fieldCount": 0,
  "affectedRows": 1,
  "insertId": 2,
  "info": "",
  "serverStatus": 2,
  "warningStatus": 0
}
```

### 8. Listar pedidos

_El rol "admin" puede ver todos los pedidos existentes. El rol "user" solo los suyos._

_[GET] localhost:9090/order?token<>_

## Ejemplo de RESPUESTA /order?token<> 

```
[
  {
    "ID": 5,
    "ESTADO": "NUEVO",
    "HORA": "11:49",
    "DESCRIPCION": "3x pizza-dominos ",
    "PAGO": 10000,
    "USUARIO": 2,
    "DIRECCION": "Carrera 12 sur A # 26-40"
  }
]
```

### 9. Editar un pedido 

_Estados a usar: 'NUEVO', 'CONFIRMADO', 'PREPARANDO', 'ENVIANDO', 'CANCELADO', 'ENTREGADO'. También se puede modificar la descripción (DESCRIPCION) y la dirección (DIRECCION) del pedido._

_[POST] localhost:9090/order/edit_

```{	
	    "ESTADO" : "CONFIRMADO",         
        "WHERE": {
		    "ID" : "4"
	    },
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6MiwiVVNFUl9OQU1FIjoibHV6bWkiLCJFTUFJTCI6Imx1emJvbmlsbGFAZ21haWwuY29tIiwiUk9MRSI6InVzZXIiLCJpYXQiOjE2MTI4MzEyNzV9.7be8tTGIuvb118w9h0YCCdhRzeeXEPPtdNJbwikElQs"
    }
```
## Ejemplo de respuesta no exitosa (/order/edit)

```
{
  "error": "Solo los administradores pueden realizar esta acción"
}
```