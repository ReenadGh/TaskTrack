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




##Core Data 

   let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let saveContext = (UIApplication.shared.delegate as! AppDelegate).saveContext
