params.data = "$projectDir/data/OSA_sample.csv"
params.outdir = "results"

log.info """\
    M A C H I N E   L E A R N I N G   P I P E L I N E
    ===================================
    data: ${params.data}
    """
    .stripIndent()

/*
 * this 1st script is going to include a python scripts
 * I just want to load the data, get dimensions, print names (maybe save as metadata)
 * view severity value counts, maybe plot value counts, maybe plot a tsne
 */
process visualize {
    input:
    path transcriptome

    output:
    path 'salmon_index'

    script:
    """
    salmon index --threads $task.cpus -t $transcriptome -i salmon_index
    """
}

workflow {
    index_ch = INDEX(params.transcriptome_file)
}
