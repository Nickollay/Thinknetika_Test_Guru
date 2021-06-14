

export class sortTableRowsByTitle {
    constructor(table) {
        this.table = table
        this.control = table.querySelector('.sort-by-title')
        this.columnIndex = this.control.cellIndex

        this.setup()
    }

    setup() {
        if(this.control) this.control.addEventListener('click', event => { this.sortRowsByTitle() })
    }


    sortRowsByTitle() {
        const rowsToSort = Array.from(this.table.rows).slice(1)
        let sortedRows

        if(this.control.querySelector('.octicon-arrow-up').classList.contains('hide')) {
            sortedRows = rowsToSort
                .sort((rowA, rowB) => rowA.cells[this.columnIndex].innerHTML > rowB.cells[this.columnIndex].innerHTML ? 1 : -1);

            this.control.querySelector('.octicon-arrow-up').classList.remove('hide')
            this.control.querySelector('.octicon-arrow-down').classList.add('hide')
        } else {
            sortedRows = rowsToSort
                .sort((rowA, rowB) => rowA.cells[this.columnIndex].innerHTML > rowB.cells[this.columnIndex].innerHTML ? -1 : 1);

            this.control.querySelector('.octicon-arrow-down').classList.remove('hide')
            this.control.querySelector('.octicon-arrow-up').classList.add('hide')
        }

        this.table.tBodies[0].append(...sortedRows);
    }
}
