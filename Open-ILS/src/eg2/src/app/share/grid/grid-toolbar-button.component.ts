import {Component, Input, OnInit, Host, TemplateRef} from '@angular/core';
import {GridToolbarButton} from './grid';
import {GridComponent} from './grid.component';

@Component({
  selector: 'eg-grid-toolbar-button',
  template: '<ng-template></ng-template>'
})

export class GridToolbarButtonComponent implements OnInit {

    // Note most input fields should match class fields for GridColumn
    @Input() label: string;
    @Input() action: () => any;

    @Input() set disabled(d: boolean) {
        // Support asynchronous disabled values by appling directly
        // to our button object as values arrive.
        if (this.button) {
            this.button.disabled = d;
        }
    }

    button: GridToolbarButton;

    // get a reference to our container grid.
    constructor(@Host() private grid: GridComponent) {
        this.button = new GridToolbarButton();
    }

    ngOnInit() {

        if (!this.grid) {
            console.warn('GridToolbarButtonComponent needs a [grid]');
            return;
        }

        this.button.label = this.label;
        this.button.action = this.action;
        this.grid.context.toolbarButtons.push(this.button);
    }
}

