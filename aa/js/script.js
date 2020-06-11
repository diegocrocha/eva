
function calcular_media() {

    var dimen = Number(metros.value);
    var tubo = (dimen * 0.8) / 25;
    var sensor = tubo;
    

    var calc_watts = Number(numero_lampadas.value) * Number(potencia_lampadas.value);
    var calc_kwatts = calc_watts / 1000;

    var calc_dia = calc_kwatts * Number(h_funcionamento.value);
    var calc_mes = calc_dia * 30;
    var calc_ano = calc_mes * 12;

    var valor_mes = calc_mes * 0.516;
    var valor_ano = calc_ano * 0.516;

    var desc_mes = valor_mes * 0.40;
    var desc_ano = valor_ano * 0.40;

    var valor_tubo = tubo * 1000;
    var valor_sensor = sensor * 150;
    var mensalidade = desc_ano * 0.30; 

    var investimento = valor_tubo + valor_sensor;
    var retorno = investimento / desc_ano;

    myPopup.innerHTML = `A empresa: ${nome_empresa.value} gasta <b>R$: ${valor_mes.toFixed(2)}</b> por mês <br> 
                                (<b>R$: ${valor_ano.toFixed(2)}</b> por ano).<br>

                                Com o nosso projeto a empresa irá economizar cerca de
                                <b>R$: ${desc_mes.toFixed(2)}</b> (até 40% de economia) por mês, e (<b>R$: ${desc_ano.toFixed(2)}</b> por ano) <br> <br>
                                                         
                                O investimento será de <b>R$:${investimento.toFixed(2)}</b>, esse valor lhe trará lucro a partir do <b>${retorno.toFixed(0)}º</b> ano, a partir desse ano será cobrado uma anuidade de <b>R$:${mensalidade.toFixed(2)}</b>`;
}