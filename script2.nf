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
    publishDir params.outdir, mode: 'copy', saveAs: { file -> "${dataset_name}.${file}" }
    tag "${dataset_name}"

    input:
    val(dataset_name)

    output:
    tuple val(dataset_name), path('data.txt'), path('meta.json'), emit: datasets

    script:
    """
    visualize.py --name ${dataset_name}
    """
}

workflow {
    index_ch = INDEX(params.transcriptome_file)
}
