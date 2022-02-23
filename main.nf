#!/usr/bin/env nextflow
/*
========================================================================================
    nf-core/umipreprocessing
========================================================================================
    Github : https://github.com/nf-core/umipreprocessing
    Website: https://nf-co.re/umipreprocessing
    Slack  : https://nfcore.slack.com/channels/umipreprocessing
----------------------------------------------------------------------------------------
*/

nextflow.enable.dsl = 2

/*
========================================================================================
    GENOME PARAMETER VALUES
========================================================================================
*/

params.fasta = WorkflowMain.getGenomeAttribute(params, 'fasta')

/*
========================================================================================
    VALIDATE & PRINT PARAMETER SUMMARY
========================================================================================
*/

WorkflowMain.initialise(workflow, params, log)

/*
========================================================================================
    NAMED WORKFLOW FOR PIPELINE
========================================================================================
*/

include { UMIPREPROCESSING } from './workflows/umipreprocessing'

//
// WORKFLOW: Run main nf-core/umipreprocessing analysis pipeline
//
workflow NFCORE_UMIPREPROCESSING {
    UMIPREPROCESSING ()
}

/*
========================================================================================
    RUN ALL WORKFLOWS
========================================================================================
*/

//
// WORKFLOW: Execute a single named workflow for the pipeline
// See: https://github.com/nf-core/rnaseq/issues/619
//
workflow {
    NFCORE_UMIPREPROCESSING ()
}

/*
========================================================================================
    THE END
========================================================================================
*/
