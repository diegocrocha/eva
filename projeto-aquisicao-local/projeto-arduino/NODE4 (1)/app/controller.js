const express = require('express');
const { ArduinoDataTemp } = require('./newserial')
const { ArduinoDataHumidity } = require('./serialHumidity')
const { ArduinoDataSwitch } = require('./serialSwitch')
const { ArduinoDataLuminosity } = require('./serialLuminosidity')
const { ArduinoDataLuminosity1 } = require('./serialLuminosidity1')
const { ArduinoDataLuminosity2 } = require('./serialLuminosidity2')
const db = require('./database')
const router = express.Router();


router.get('/', (request, response, next) => {

    let sum = ArduinoDataTemp.List.reduce((a, b) => a + b, 0);
    let average = (sum / ArduinoDataTemp.List.length).toFixed(2);
    let sumHour = ArduinoDataTemp.ListHour.reduce((a, b) => a + b, 0);
    let averageHour = (sumHour / ArduinoDataTemp.ListHour.length).toFixed(2);

    response.json({
        data: ArduinoDataTemp.List,
        total: ArduinoDataTemp.List.length,
        average: isNaN(average) ? 0 : average,
        dataHour: ArduinoDataTemp.ListHour,
        totalHour: ArduinoDataTemp.ListHour.length,
        averageHour: isNaN(averageHour) ? 0 : averageHour
    });
});

router.get('/humidity', (request, response, next) => {

    let sum = ArduinoDataHumidity.List.reduce((a, b) => a + b, 0);
    let average = (sum / ArduinoDataHumidity.List.length).toFixed(2);
    let sumHour = ArduinoDataHumidity.ListHour.reduce((a, b) => a + b, 0);
    let averageHour = (sumHour / ArduinoDataHumidity.ListHour.length).toFixed(2);

    response.json({
        data: ArduinoDataHumidity.List,
        total: ArduinoDataHumidity.List.length,
        average: isNaN(average) ? 0 : average,
        dataHour: ArduinoDataHumidity.ListHour,
        totalHour: ArduinoDataHumidity.ListHour.length,
        averageHour: isNaN(averageHour) ? 0 : averageHour
    });

});

router.get('/switch', (request, response, next) => {

    let sum = ArduinoDataSwitch.List.reduce((a, b) => a + b, 0);
    let average = (sum / ArduinoDataSwitch.List.length).toFixed(2);
    let sumHour = ArduinoDataSwitch.ListHour.reduce((a, b) => a + b, 0);
    let averageHour = (sumHour / ArduinoDataSwitch.ListHour.length).toFixed(2);

    response.json({
        data: ArduinoDataSwitch.List,
        total: ArduinoDataSwitch.List.length,
        average: isNaN(average) ? 0 : average,
        dataHour: ArduinoDataSwitch.ListHour,
        totalHour: ArduinoDataSwitch.ListHour.length,
        averageHour: isNaN(averageHour) ? 0 : averageHour
    });

});

router.get('/luminosity', (request, response, next) => {

    let sum = ArduinoDataLuminosity.List.reduce((a, b) => a + b, 0);
    let average = (sum / ArduinoDataLuminosity.List.length).toFixed(2);
    let sumHour = ArduinoDataLuminosity.ListHour.reduce((a, b) => a + b, 0);
    let averageHour = (sumHour / ArduinoDataLuminosity.ListHour.length).toFixed(2);

    response.json({
        data: ArduinoDataLuminosity.List,
        total: ArduinoDataLuminosity.List.length,
        average: isNaN(average) ? 0 : average,
        dataHour: ArduinoDataLuminosity.ListHour,
        totalHour: ArduinoDataLuminosity.ListHour.length,
        averageHour: isNaN(averageHour) ? 0 : "averageHour"
    });
}),
    router.get('/luminosity1', (request, response, next) => {

        let sum = ArduinoDataLuminosity1.List.reduce((a, b) => a + b, 0);
        let average = (sum / ArduinoDataLuminosity1.List.length).toFixed(2);
        let sumHour = ArduinoDataLuminosity1.ListHour.reduce((a, b) => a + b, 0);
        let averageHour = (sumHour / ArduinoDataLuminosity1.ListHour.length).toFixed(2);

        response.json({
            data: ArduinoDataLuminosity1.List,
            total: ArduinoDataLuminosity1.List.length,
            average: isNaN(average) ? 0 : average,
            dataHour: ArduinoDataLuminosity1.ListHour,
            totalHour: ArduinoDataLuminosity1.ListHour.length,
            averageHour: isNaN(averageHour) ? 0 : "averageHour"
        });
    }),
    router.get('/luminosity2', (request, response, next) => {

        let sum = ArduinoDataLuminosity2.List.reduce((a, b) => a + b, 0);
        let average = (sum / ArduinoDataLuminosity2.List.length).toFixed(2);
        let sumHour = ArduinoDataLuminosity2.ListHour.reduce((a, b) => a + b, 0);
        let averageHour = (sumHour / ArduinoDataLuminosity2.ListHour.length).toFixed(2);

        response.json({
            data: ArduinoDataLuminosity2.List,
            total: ArduinoDataLuminosity2.List.length,
            average: isNaN(average) ? 0 : average,
            dataHour: ArduinoDataLuminosity2.ListHour,
            totalHour: ArduinoDataLuminosity2.ListHour.length,
            averageHour: isNaN(averageHour) ? 0 : "averageHour"
        });
    }),

    router.post('/sendData', (request, response) => {
        // temperature = ArduinoDataTemp.List[ArduinoDataTemp.List.length -1];
        luminosidade = ArduinoDataLuminosity.List[ArduinoDataLuminosity.List.length - 1]
        luminosidade1 = ArduinoDataLuminosity1.List[ArduinoDataLuminosity1.List.length - 1]
        luminosidade2 = ArduinoDataLuminosity2.List[ArduinoDataLuminosity2.List.length - 1]

        let sorteado = parseInt(Math.random() * 12)

        const registros_mantidos_tabela_leitura = 8;

        if (sorteado == 0) {
            var sql = `INSERT INTO tb_registro (registro,luminosidade,fk_sensor_id) VALUES (CONVERT(Datetime, '${agora()}', 120),${luminosidade},1);`
        }
        else if (sorteado == 1) {
            var sql = `INSERT INTO tb_registro (registro,luminosidade,fk_sensor_id) VALUES (CONVERT(Datetime, '${agora()}', 120),${luminosidade1},2);`
        }
        else if (sorteado == 2) {
            var sql = `INSERT INTO tb_registro (registro,luminosidade,fk_sensor_id) VALUES (CONVERT(Datetime, '${agora()}', 120),${luminosidade1},3);`
        }
        else if (sorteado == 3) {
            var sql = `INSERT INTO tb_registro (registro,luminosidade,fk_sensor_id) VALUES (CONVERT(Datetime, '${agora()}', 120),${luminosidade},4);`
        }
        else if (sorteado == 4) {
            var sql = `INSERT INTO tb_registro (registro,luminosidade,fk_sensor_id) VALUES (CONVERT(Datetime, '${agora()}', 120),${luminosidade},5);`
        }
        else if (sorteado == 5) {
            var sql = `INSERT INTO tb_registro (registro,luminosidade,fk_sensor_id) VALUES (CONVERT(Datetime, '${agora()}', 120),${luminosidade},6);`
        }
        else if (sorteado == 6) {
            var sql = `INSERT INTO tb_registro (registro,luminosidade,fk_sensor_id) VALUES (CONVERT(Datetime, '${agora()}', 120),${luminosidade2},7);`
        }
        else if (sorteado == 7) {
            var sql = `INSERT INTO tb_registro (registro,luminosidade,fk_sensor_id) VALUES (CONVERT(Datetime, '${agora()}', 120),${luminosidade},8);`
        }
        else if (sorteado == 8) {
            var sql = `INSERT INTO tb_registro (registro,luminosidade,fk_sensor_id) VALUES (CONVERT(Datetime, '${agora()}', 120),${luminosidade},9);`
        }
        else if (sorteado == 9) {
            var sql = `INSERT INTO tb_registro (registro,luminosidade,fk_sensor_id) VALUES (CONVERT(Datetime, '${agora()}', 120),${luminosidade},10);`
        }
        else if (sorteado == 10) {
            var sql = `INSERT INTO tb_registro (registro,luminosidade,fk_sensor_id) VALUES (CONVERT(Datetime, '${agora()}', 120),${luminosidade1},11);`
        }  
        else{
            var sql = `INSERT INTO tb_registro (registro,luminosidade,fk_sensor_id) VALUES (CONVERT(Datetime, '${agora()}', 120),${luminosidade2},12);`
        }

        db.conectar().then(() => {

            return db.sql.query(`
            
            ${sql}`)
            
            // delete from tb_registro where registro not in 
            // (select top ${registros_mantidos_tabela_leitura} registro from tb_registro order by registro desc);`
    
            .then(() => {
                console.log('Registro inserido com sucesso!');
            });

            
            
    
        }).catch(erro => {
    
            console.error(`Erro ao tentar registrar aquisição na base: ${erro}`);
    
        }).finally(() => {
            db.sql.close();
        });
        response.sendStatus(200);
     });


function agora() {
    const momento_atual = new Date();
    const retorno = `${momento_atual.toLocaleDateString()} ${momento_atual.toLocaleTimeString()}`;
    console.log(`Data e hora atuais: ${retorno}`);
    return retorno;
}


module.exports = router;
