function sortRowsByTitle() {
    let table = document.querySelector('table'),
        rows = table.querySelectorAll('tr'),
        sortedRows = []

    for(let i = 1; i < rows.length; i++) {
        sortedRows.push(rows[i])
    }

    let sortedTable = table.cloneNode(true)

    if(this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
        sortedRows.sort(compareRowsAsc)
        this.querySelector('.octicon-arrow-up').classList.remove('hide')
        this.querySelector('.octicon-arrow-down').classList.add('hide')
    } else {
        sortedRows.sort(compareRowsDesc)
        this.querySelector('.octicon-arrow-down').classList.remove('hide')
        this.querySelector('.octicon-arrow-up').classList.add('hide')
    }

    sortedTable.querySelector('tr').parentNode.replaceChild(rows[0], sortedTable.querySelector('tr'))

    let parentElementOfTr = sortedTable.querySelectorAll('tr')[1].parentNode

    parentElementOfTr.querySelectorAll('tr').forEach(n => n.remove())

    for(let i =0; i < sortedRows.length; i++) {
       parentElementOfTr.appendChild(sortedRows[i])
    }

    table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc(row1, row2) {
    let testTitle1 = row1.querySelector('td').textContent,
        testTitle2 = row2.querySelector('td').textContent

    if (testTitle1 < testTitle2) { return -1 }
    if (testTitle1 > testTitle2) { return 1 }
    return 0
}

function compareRowsDesc(row1, row2) {
    let testTitle1 = row1.querySelector('td').textContent,
        testTitle2 = row2.querySelector('td').textContent

    if (testTitle1 < testTitle2) { return 1 }
    if (testTitle1 > testTitle2) { return -1 }
    return 0
}

document.addEventListener('turbolinks:load', function() {
    let control = document.querySelector('.sort-by-title')

    if (control) { control.addEventListener('click', sortRowsByTitle) }
} )


