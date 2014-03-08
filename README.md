## How to use
Save value in settings:
    
    Settings.any_name = "string, integer, float or boolean"
    
Get value from settings:

    Settings.any_name
    => "string, integer, float or boolean"
    
## Design decisions and spent time
Settings is a Singleton model with one hash field. Any allowed types of settings are saved to hash in this one field.

Task took 2 hours. 