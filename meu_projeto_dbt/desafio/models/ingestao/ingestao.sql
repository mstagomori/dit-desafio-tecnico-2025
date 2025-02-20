WITH cleaned_data AS (
    SELECT
        id_paciente,
        sexo,
        CASE
            WHEN obito = 'True' OR obito = '1' THEN 1
            ELSE 0
        END AS obito,

        CASE
            WHEN luz_eletrica = 'True' OR luz_eletrica = '1' THEN 1
            ELSE 0
        END AS luz_eletrica,

        CASE
            WHEN em_situacao_de_rua = 'True' OR em_situacao_de_rua = '1' THEN 1
            ELSE 0
        END AS em_situacao_de_rua,

        CASE
            WHEN possui_plano_saude = 'True' OR possui_plano_saude = '1' THEN 1
            ELSE 0
        END AS possui_plano_saude,

        CASE
            WHEN vulnerabilidade_social = 'True' OR vulnerabilidade_social = '1' THEN 1
            ELSE 0
        END AS vulnerabilidade_social,

        CASE
            WHEN familia_beneficiaria_auxilio_brasil = 'True' OR familia_beneficiaria_auxilio_brasil = '1' THEN 1
            ELSE 0
        END AS familia_beneficiaria_auxilio_brasil,

        CASE
            WHEN crianca_matriculada_creche_pre_escola = 'True' OR crianca_matriculada_creche_pre_escola = '1' THEN 1
            ELSE 0
        END AS crianca_matriculada_creche_pre_escola,
        
        CASE
            WHEN raca_cor = 'Não' THEN 'Não desejo informar'
            ELSE raca_cor
        END AS raca_cor,

        CASE
            WHEN religiao IN ('Não', '10 EAP 01', 'ORQUIDEA', 'ESB ALMIRANTE', 'Acomp Cresc e Desenv da Criança') THEN 'Sem religião'
            WHEN religiao = 'Candombé' THEN 'Religião de matriz africana'
            WHEN religiao = 'Sim' THEN 'Outra'
            ELSE religiao
        END AS religiao,

        CASE
            WHEN renda_familiar IN ('Manhã', 'Internet') THEN 'Não informado'
            ELSE renda_familiar
        END AS renda_familiar,

        CASE
            WHEN situacao_profissional IN ('Autônomo com previdência social', 'Autônomo sem previdência social', 'Empregador') THEN 'Autônomo'
            WHEN situacao_profissional = 'Não trabalha' THEN 'Não se aplica'
            WHEN situacao_profissional = 'Médico Urologista' THEN 'Emprego Formal'
            WHEN situacao_profissional = 'SMS CAPS DIRCINHA E LINDA BATISTA AP 33' THEN 'Outro'
            ELSE situacao_profissional
        END AS situacao_profissional,
        bairro,
        ocupacao,
        escolaridade,
        nacionalidade,
        data_nascimento,
        data_cadastro,
        data_atualizacao_cadastro,
        frequenta_escola,
        meios_transporte,
        doencas_condicoes,
        orientacao_sexual,
        em_caso_doenca_procura,
        altura,
        pressao_sistolica,
        pressao_diastolica,
        n_atendimentos_atencao_primaria,
        n_atendimentos_hospital,
        updated_at,
        tipo


    FROM
        public_raw_data.dados_ficha_a_desafio
)
SELECT * FROM cleaned_data