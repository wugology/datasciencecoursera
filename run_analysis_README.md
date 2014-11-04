##Run Analysis
===================

Run Analysis changes the working directory several times and reads files until all data is loaded. 

It also tests whether the data loaded properly by using head() and str() to check the data.

Then it creates two data frames, testData and trainData, out of the loaded data from the "test" folders and from the "train" folders.

Next, it merges these two data frames into finalData.

Then, it calculates the means and standard deviations of some of the data.

Then, it renames some of the data, so that it is clearer (for example, instead of the code "1", it uses the word "WALKING").

Finally, it writes the data to a .txt file.
