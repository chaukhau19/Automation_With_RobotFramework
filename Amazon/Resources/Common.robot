*** Settings ***
Library   Collections
Resource  ../Data/InputData.robot
Resource  ../Resources/DataManager.robot


*** Variables ***

*** Keywords ***
Begin Web Test
    ${Mode} =    Run Keyword And Return Status    Should Contain    ${DATA_DIRECTORY}    ${HEADLESS_FOLDER}
    IF    ${Mode}
        Open Browser  about:blank  headlesschrome  options=add_argument("--ignore-certificate-errors");add_argument("log-level=3")
    ELSE
        Open Browser  about:blank  ${BROWSER}  options=add_argument("--ignore-certificate-errors");add_argument("log-level=3")
    END
    Sleep  1s
    Go to  ${BASE_URL}
    Set Window Size  1920  1080

End Web Test
    Close All Browsers

