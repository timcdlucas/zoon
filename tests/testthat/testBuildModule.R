context('BuildModule')

directory <- tempdir()

NewModule <- function(.df){}

test_that('Simplest case should build', {
  

  build <- BuildModule(object = NewModule,
              type = 'model',
              title = 'test',
              description = 'test',
              author = 'tom',
              email = 'tom@tom.com',
              dir = directory) 

  expect_is(build, "character")
  
  expect_equal(build, 'NewModule')
  expect_true(file.exists(file.path(directory, 'NewModule.R')))
  unlink(x = file.path(directory, 'NewModule.R'))
  
})

test_that('All metadata given, and correct', {

  expect_error(BuildModule(object = NewModule,
                           type = '',
                           title = 'test',
                           description = 'test',
                           author = 'tom',
                           email = 'tom@tom.com',
                           dir = directory),
               'type must be one of')
  
  expect_error(BuildModule(object = NewModule,
                           type = 'zoon',
                           title = 'test',
                           description = 'test',
                           author = 'tom',
                           email = 'tom@tom.com',
                           dir = directory),
               'type must be one of')
  
  expect_warning(BuildModule(object = NewModule,
                           type = 'model',
                           title = '',
                           description = 'test',
                           author = 'tom',
                           email = 'tom@tom.com',
                           dir = directory),
               'Information not complete')  
  
  expect_warning(BuildModule(object = NewModule,
                             type = 'model',
                             title = 'test',
                             description = '',
                             author = 'tom',
                             email = 'tom@tom.com',
                             dir = directory),
                 'Information not complete') 
  
  expect_warning(BuildModule(object = NewModule,
                             type = 'model',
                             title = 'test',
                             description = 'test',
                             author = '',
                             email = 'tom@tom.com',
                             dir = directory),
                 'Information not complete') 
  
  expect_warning(BuildModule(object = NewModule,
                             type = 'model',
                             title = 'test',
                             description = 'test',
                             author = 'tom',
                             email = '',
                             dir = directory),
                 'Information not complete')
})

test_that('Module parameters', {
  
  NewModule2 <- function(.df, tom){}
  
  expect_warning(BuildModule(object = NewModule2,
                             type = 'model',
                             title = 'test',
                             description = 'test',
                             author = 'tom',
                             email = 'tom@tom.com',
                             dir = directory),
                 'Information not complete')
  
  NewModule3 <- function(){}
  
  expect_warning(BuildModule(object = NewModule3,
                             type = 'model',
                             title = 'test',
                             description = 'test',
                             author = 'tom',
                             email = 'tom@tom.com',
                             dir = directory),
                 'Your model module does not contain the default arguements')
  
  expect_warning(BuildModule(object = NewModule2,
                             type = 'model',
                             title = 'test',
                             description = 'test',
                             author = 'tom',
                             paras = list(.df = 'this',
                                          tom = 'that'),
                             email = 'tom@tom.com',
                             dir = directory),
                 'Parameter descriptions for defaults')
})
  
test_that('Misc tests', {
  
  expect_error(BuildModule(object = NewModule,
                             type = 'model',
                             title = 'test',
                             description = 'test',
                             author = 'tom',
                             email = 'tom@tom.com',
                             dir = 'thisdoesnotexist'),
                 'directory is not writeable')
  
})
