#!/usr/bin/env python
# coding: utf-8

# In[1]:


# Practice 1
# creating variables
# a)
rollno =10
print(rollno)
print(id(rollno))
print(type(rollno))


# In[2]:


# b)
firstname = 'abc'
print(firstname)
print(id(firstname))
print(type(firstname))


# In[4]:


# C)
lastname = 'xyz'
print(lastname)
print(id(lastname))
print(type(lastname))


# In[5]:


# d)
maxmarks =50
print(maxmarks)
print(id(maxmarks))
print(type(maxmarks))


# In[68]:


# Practice 2
# Naming a Variable
# a)
var1 = 2
print (var1)
# value 2 is assigned to the variable var1


# In[9]:


# b)
2var = 2
# the variable can not be start with numerical values


# In[10]:


# c)
var 1 = 2
# the variable can not have space in the name


# In[11]:


# d)
var$2 =2
# the variable can not have special character other then _(underscore)


# In[69]:


# Practice 3
# Assigning Values to a variable
# a)
Class = 5
print(Class)
# value 5 is assigned to the variable Class due to case senstivity Class is not considerd as keyword


# In[15]:


# b)
class = 14
# variable can not be keyword 


# In[71]:


# c)
DEF = 13
print(DEF)
# value 13 is assigned to variable DEF 


# In[18]:


# d)
def = 12
# variable can not be keyword d


# In[73]:


# e)
a = TRUE
# 'TRUE' coats is not around the TRUE value is not assigned to variable 'a' 
# due to case senstivity the boolean value True is also not assigned to variable a


# In[74]:


# f)
b = false
#'false' coats is not around the false value is not assigned to variable 'b' 
# due to case senstivity the boolean value False is also not assigned to variable 'b'


# In[28]:


# Practice 4
# Using id()
# a)
marks = 45.5
print(marks)
print(id(marks))
print(type(marks))


# In[29]:


# b)
marks = 40.5
print(marks)
print(id(marks))
print(type(marks))


# In[ ]:


# C) No, id for both is not same because varible is same but value asssiged to it are different.


# In[31]:


# Practice 5
# Formatting the output
# a)
marks=87
maxmarks = 100
per = marks/maxmarks*100
print(per,'%')


# In[33]:


# b)
firstname='abc'
lastname='xyz'
fullname=firstname+' '+lastname
print(fullname)


# In[34]:


# c)
print(fullname,' scored ',per,'%')


# In[35]:


# Practice 6


# In[36]:


# Practice 7
# Arithmetic operations
# a)
1+"2"
# concatenation can only be done between string 


# In[37]:


# b)
"1" + "2"
# string "2" concatenate with string "1" gives the out put as  combined string


# In[38]:


# c)
1/2
# division operasion is executed between 1 and 2 and float value is returned


# In[39]:


# d)
1//2
# float division operasion is executed between 1 and 2 and int value returned. the values before decimal point is returned 


# In[40]:


# Practice 8
# Loggical operations
# a)
True and True
# we have passed the boolean true, true follwing with the and operation , where True and True is True


# In[41]:


# b)
True and False
# we have passed the boolean true, False follwing with the and operation , where True and False is False


# In[43]:


# c)
False or True
# we have passed the boolean False, True follwing with the or operation , where False or True is True


# In[44]:


# d)
False or False
# we have passed the boolean False , False follwing with the or operation , where False or False is False


# In[48]:


# Practice 9
# Identity and Membership operations
# a)

print(firstname in fullname)

# as string in firstname variable is available in the string assigned to fullname, True output is generated


# In[49]:


# b)

print(firstname is fullname)
# as string in firstname variable is not string in fullname variable false output is generated


# In[53]:


# Practice 10
# Associativity
# if 
a=4
b=3
c=2
d=a**b+c
e=a**(b+c)


# In[54]:


# a)
print(d)


# In[55]:


# b)
print(e)


# In[56]:


# c)
# value of d and e are different dure to precedence order for d 4^3+2=>64+2=>66 for e 4^(3+2)=>4^5=>1024 PEMDAS


# In[57]:


# Practice 11
# Creating a Basic program
radius=6
pi = 22/7
area=pi*radius**2
print(area)


# In[80]:


# Practice 12
# create a basic program
price=85
tax=price*0.18
amoumt=price+tax
print('tax =',tax,' , price with tax =',price+tax)


# In[79]:


# practice 13
# create a basic program
amount=3333
conv=3333/75
print(conv ,'$ for INR 3333' )


# In[78]:


# Practice 14
# create a basic program

PP = 500*(1/(1+0.07))
print('purchasing power',PP)


# In[ ]:


# Practice 15
# save the file

