import openpyxl
import yaml
import os
import re

def read_excel_file(filename, sheetname, priority, priority_column):
    # Load YAML file
    current_directory = os.path.dirname(os.path.abspath(__file__))
    yaml_file_path = os.path.join(current_directory, '../Data/IP.yaml')

    with open(yaml_file_path, 'r') as yaml_file:
        yaml_data = yaml.safe_load(yaml_file)

    # Load Excel file
    wb = openpyxl.load_workbook(filename)
    ws = wb[sheetname]

    data = []

    for row in ws.iter_rows(min_row=2, values_only=True):
        current_priority = row[priority_column]


        is_running = False
        if (
            priority == 'LOW'
            and current_priority in ['LOW', 'MEDIUM', 'HIGH', 'CRITICAL']
        ):
            is_running = True
        elif (
            priority == 'MEDIUM'
            and current_priority in ['MEDIUM', 'HIGH', 'CRITICAL']
        ):
            is_running = True
        elif priority == 'HIGH' and current_priority in ['HIGH', 'CRITICAL']:
            is_running = True
        elif priority == 'CRITICAL' and current_priority == 'CRITICAL':
            is_running = True

        if is_running:
            values = []
            for cell in row:
                if isinstance(cell, str) and '{{' in cell and '}}' in cell:
                    # find and replace in the value of cell
                    matches = re.findall(r'{{(.*?)}}', cell)
                    for match in matches:
                        if match in yaml_data:
                            cell = cell.replace(f'{{{{{match}}}}}', str(yaml_data[match]))

                # Replace None values with empty string
                if cell is None:
                    cell = ''
                values.append(cell)
            data.append(values)

    return data
