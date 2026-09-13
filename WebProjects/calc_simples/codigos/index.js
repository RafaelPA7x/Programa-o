let display= document.getElementById("display");
let botoesNumeros= document.querySelectorAll(".numero");
let botoesOperadores= document.querySelectorAll(".operador");
let botaoIgual= document.getElementById("igual");
let botaoLimpar= document.getElementById("limpar")

let primeiroValor= "";
let segundoValor= "";
let operacao= "";
let segundoNumero= false;

botoesNumeros.forEach(function(botao){
    botao.onclick= function(){

        if (segundoNumero == false){

            primeiroValor = primeiroValor + botao.innerText;
            display.innerText = primeiroValor;
        } else {
            segundoValor = segundoValor + botao.innerText;
            display.innerText = segundoValor;
        }
    };
});

botoesOperadores.forEach(function(botao){
    botao.onclick= function(){

        primeiroValor= display.innerText;
        operacao= botao.getAttribute("data-operacao");
        segundoNumero= true;
    };
});

botaoIgual.onclick= function(){
    segundoValor= display.innerText;
    let a = parseFloat(primeiroValor);
    let b = parseFloat(segundoValor);
    let resultado;

    if (operacao == "+"){
        resultado = a + b;
    } else if (operacao == "-"){
        resultado = a - b;
    } else if(operacao == "*"){
        resultado = a * b;
    } else if (operacao == "/"){
        if (b == 0){
            alert("nao e possivel dividir por 0");
            return;
        }
        resultado = a / b;
    } 
    
    display.innerText = resultado;
    alert("resultado " + resultado);

    primeiroValor = resultado;
    segundoValor = "";
    segundoNumero = false;
}

botaoLimpar.onclick= function(){
    primeiroValor = "";
    segundoValor = "";
    operacao = "";
    segundoNumero = false;
    display.innerText = "0";
}

