# Task Track


A simple application to add tasks and track whether they have been completed or not

<p align="center">
<img src="https://user-images.githubusercontent.com/66906961/150975956-8af3e9bf-8776-43ae-8715-dcbe437f48d7.png" width="200" height="400">
<img src="https://user-images.githubusercontent.com/66906961/150975978-cca18a81-0bff-43de-b8f5-eac96cfa6f94.png" width="200" height="400">
<img src="https://user-images.githubusercontent.com/66906961/150975990-ae71f8cf-246f-446c-9f2e-34d1327102c1.png" width="200" height="400">

</p>

I used :
- Core Data to save and retrieve data when close the application and open it again
- 'Charts'Cocopods to display the data on chart




## Core Data 


<img src="https://user-images.githubusercontent.com/66906961/150977894-9fbdca28-a194-495b-92e9-6b15c2609c1f.png" width="400" height="100">


```
import CoreData

```


- start with declaring the variable as 'context' 
- Our managed object context manages the changes that have been made to the objects 

```
   let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
  ```
  
 - Whether we are creating, updating, or deleting records, in order for those changes to persist we must call save on the managed object context, I declare it as a reference to that method
   
```
    let saveContext = (UIApplication.shared.delegate as! AppDelegate).saveContext
```



### Create Objects
Here, I created my Entity and called it Task, and it has some features : 

<img width="881" alt="Screen Shot 1443-06-22 at 3 42 03 PM" src="https://user-images.githubusercontent.com/66906961/150979403-3c7b9712-891d-488a-b0be-1c8190b38f47.png">

