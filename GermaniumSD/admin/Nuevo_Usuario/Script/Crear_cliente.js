var form = document.getElementById("formulario");
var button = document.getElementById("bregistrarse");
var mensaje = document.getElementById("mensaje");

document.getElementById("formulario").addEventListener("submit", function(event) {
    event.preventDefault(); // Evitar envío del formulario por defecto    

    var data = new FormData(form);

    //Se confirma que las contraseñas sean iguales
    if (data.get("contraseña1") !== data.get("contraseña2")) {
        mensaje.innerHTML = "Las contraseñas no coinciden.";
        return;
    }

    //Se crea un objeto XMLHttpRequest para realizar una solicitud HTTP asincrónica 
    //mediante el método POST a la URL nuevo.php.
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "Script/nuevo.php", true);

    //Se define la función onreadystatechange para manejar los cambios de estado de la solicitud. 
    //Cuando el estado de XMLHttpRequest es XMLHttpRequest.DONE (4) y el estado de la respuesta es 
    //200 (éxito), se procesa la respuesta.
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                var response = xhr.responseText;
                if (response === "Cuenta creada exitosamente.") {
                    mensaje.innerHTML = response;
                    form.reset();
                    // Redireccionar a la página de inicio de sesión
                    window.location.href = "../index.php";
                } else {
                    if (!mensaje.querySelector(".error")) {
                        var errorSpan = document.createElement("span");
                        errorSpan.classList.add("error");
                        errorSpan.innerHTML = response;
                        mensaje.appendChild(errorSpan);
                    }
                }
            } else {
                mensaje.innerHTML = "Error en el servidor. Por favor, intenta nuevamente.";
            }
        }
    };

    xhr.send(data);
});
