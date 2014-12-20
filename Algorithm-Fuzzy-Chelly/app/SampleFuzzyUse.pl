#!/usr/bin/env perl

use strict;
use warnings;

##########################################################################################################
#****************************DEFINING THE RANGE : UNIVERSE OF DISCOURSE [0..25] For example **************


#Global Variables

my $min_range = 0;
my $max_range = 25;

my $range = $max_range - $min_range;


##########################################################################################################
#*********************************************************************************************************
						#THE FUZZY PROCESS

##########################################################################################################
#**********************************************************************************************************

						#Input-Output Description 


# ---> In this sample, we will use 2 inputs and 1 output

##########################################################################################################

#Linguistic Variable for input 1 =  $mature_input1 : Definied with 3 linguistic triangular membership functions (3 terms sets)
 
my $Mature_Low->{0} = 0;
my $Mature_Low->{5} = 1;
my $Mature_Low->{10} = 0;
my $Mature_Low = Transform_Step1_RANGE($min_range,$max_range,$Mature_Low);
my $Mature_Low = Generate_Values_Membership_Form($Mature_Low);


my $Mature_Medium->{7} = 0;
my $Mature_Medium->{12} = 1;
my $Mature_Medium->{17} = 0;
my $Mature_Medium = Transform_Step1_RANGE ($min_range,$max_range,$Mature_Medium);
my $Mature_Medium = Generate_Values_Membership_Form($Mature_Medium);


my $Mature_High->{15} = 0;
my $Mature_High->{20} = 1;
my $Mature_High->{25} = 0;
my $Mature_High = Transform_Step1_RANGE ($min_range,$max_range,$Mature_High);
my $Mature_High = Generate_Values_Membership_Form($Mature_High);

##########################################################################################################

#Linguistic Variable for input 1 = $semimature_input2 : Definied with 3 linguistic triangular membership functions (3 terms sets)

my $SemiMature_Low->{0} = 0;
my $SemiMature_Low->{5} = 1;
my $SemiMature_Low->{10} = 0;
my $SemiMature_Low = Transform_Step1_RANGE ($min_range,$max_range,$SemiMature_Low);
my $SemiMature_Low = Generate_Values_Membership_Form($SemiMature_Low);


my $SemiMature_Medium->{7} = 0;
my $SemiMature_Medium->{12} = 1;
my $SemiMature_Medium->{17} = 0;
my $SemiMature_Medium = Transform_Step1_RANGE ($min_range,$max_range,$SemiMature_Medium);
my $SemiMature_Medium = Generate_Values_Membership_Form($SemiMature_Medium);


my $SemiMature_High->{15} = 0;
my $SemiMature_High->{20} = 1;
my $SemiMature_High->{25} = 0;
my $SemiMature_High = Transform_Step1_RANGE ($min_range,$max_range,$SemiMature_High);
my $SemiMature_High = Generate_Values_Membership_Form($SemiMature_High);

##########################################################################################################

#Linguistic Variable 3 (output 1) =  $MATURITY  definied with 2 linguistic triangular membership functions (2 terms sets)


my $Maturity_SemiMature->{0} = 0;
my $Maturity_SemiMature->{8} = 1;
my $Maturity_SemiMature->{15} = 0;
my $Maturity_SemiMature = Transform_Step1_RANGE ($min_range,$max_range,$Maturity_SemiMature);
my $Maturity_SemiMature = Generate_Values_Membership_Form($Maturity_SemiMature);


my $Maturity_Mature->{10} = 0;
my $Maturity_Mature->{18} = 1;
my $Maturity_Mature->{25} = 0;
my $Maturity_Mature = Transform_Step1_RANGE ($min_range,$max_range,$Maturity_Mature);
my $Maturity_Mature = Generate_Values_Membership_Form($Maturity_Mature);

##########################################################################################################

#**********************************************************************************************************
#*********************************************************************************************************

						#Input-Output Specification  

#**********************************************************************************************************
#*********************************************************************************************************

##########################################################################################################

############### Getting the values $Vble_1 and $Vble_2 in the specified $range   ##########################################

#Vbles to fuzzify $Vble1 & $Vble2

my $Vble_1 = 8;
my $Vble_2 = 9;


my $mature_input1 = ScalingToTheRange($min_range,$max_range,$Vble_1);

print "  $mature_input1\n";

my $semimature_input2 = ScalingToTheRange($min_range,$max_range,$Vble_2);

print "  $semimature_input2\n";


############### The Input's Membership Function Values : Fuzzification ###############################


my $Fuzzy_Mature_Low = $Mature_Low->{$mature_input1};

print " Fuzzy_Mature_Low = $Fuzzy_Mature_Low\n";

my $Fuzzy_Mature_Medium = $Mature_Medium->{$mature_input1};

print " Fuzzy_Mature_Medium = $Fuzzy_Mature_Medium\n";
 
my $Fuzzy_Mature_High = $Mature_High->{$mature_input1};

print " Fuzzy_Mature_High = $Fuzzy_Mature_High\n";



my $Fuzzy_SemiMature_Low = $SemiMature_Low->{$semimature_input2};

print " Fuzzy_SemiMature_Low = $Fuzzy_SemiMature_Low\n";

my $Fuzzy_SemiMature_Medium = $SemiMature_Medium->{$semimature_input2};

print " Fuzzy_SemiMature_Medium = $Fuzzy_SemiMature_Medium\n";
 
my $Fuzzy_SemiMature_High = $SemiMature_High->{$semimature_input2};

print " Fuzzy_SemiMature_High = $Fuzzy_SemiMature_High\n";


###############   Apply Fuzzy Operator : Aggregation :   "AND" OPERATOR  ###############################

# Define the operator for Aggregation : ("AND"  ,  "OR"  , "PROD") 

my $Op_Aggregation = "AND";

# Aggragation phase


my $rule1 = Fuzzy_Aggregation_Step($Op_Aggregation ,$Fuzzy_Mature_Low,$Fuzzy_SemiMature_Low);

print " rule1 = $rule1\n";

my $weight_rule1 = 1;

my $rule2 = Fuzzy_Aggregation_Step($Op_Aggregation ,$Fuzzy_Mature_Low,$Fuzzy_SemiMature_Medium);

print " rule2 = $rule2\n";

my $weight_rule2 = 1;


my $rule3 = Fuzzy_Aggregation_Step($Op_Aggregation ,$Fuzzy_Mature_Medium,$Fuzzy_SemiMature_Low);

print " rule3 = $rule3\n";

my $weight_rule3 = 1;


my $rule4 = Fuzzy_Aggregation_Step($Op_Aggregation ,$Fuzzy_Mature_Medium,$Fuzzy_SemiMature_Medium);

print " rule4 = $rule4\n";

my $weight_rule4 = 1;

###############  IMPLICATION  :   "OR" OPERATOR  ###############################

# Define the operator for Implication : ("MIN" , "PROD")

my $Op_Implication = "MIN";

# Implication phase


my $rule1_result_fuzzyset = Fuzzy_Implication_Step($Op_Implication, $Maturity_Mature, ($weight_rule1 * $rule1));

my $rule2_result_fuzzyset = Fuzzy_Implication_Step($Op_Implication, $Maturity_SemiMature, ($weight_rule2 * $rule2));

my $rule3_result_fuzzyset = Fuzzy_Implication_Step($Op_Implication, $Maturity_Mature, ($weight_rule3 * $rule3));

my $rule4_result_fuzzyset = Fuzzy_Implication_Step($Op_Implication, $Maturity_SemiMature, ($weight_rule4* $rule4));



###############  Accumulation  : Aggregate All Outputs ###############################

# Define the operator for  Accumulation : ("MAX" , "SUM")

my $Op_Accumulation = "MAX";

#  Accumulation phase


my $MATURITY_result_fuzzyset = initialize_fuzzyterm(0);


my $MATURITY_result_fuzzyset = Fuzzy_Accumulation_Step($Op_Accumulation,$MATURITY_result_fuzzyset,$rule1_result_fuzzyset);

my $MATURITY_result_fuzzyset = Fuzzy_Accumulation_Step($Op_Accumulation,$MATURITY_result_fuzzyset,$rule2_result_fuzzyset);

my $MATURITY_result_fuzzyset = Fuzzy_Accumulation_Step($Op_Accumulation,$MATURITY_result_fuzzyset,$rule3_result_fuzzyset);

my $MATURITY_result_fuzzyset = Fuzzy_Accumulation_Step($Op_Accumulation,$MATURITY_result_fuzzyset,$rule4_result_fuzzyset);


###############  Defuzzification  ###############################

# Define the operator for  Defuzzification : ("CG")

my $Op_Defuzzification = "CG";

#  Defuzzification phase


my $MATURITY_result_crisp = Fuzzy_Defuzzification_Step($Op_Defuzzification, $MATURITY_result_fuzzyset);

print " MATURITY_result_crisp = $MATURITY_result_crisp\n";

my  $MATURITY = Transform_Step2__RANGE($min_range, $max_range, $MATURITY_result_crisp);

##########################################################################################################
##########################################################################################################
##########################################################################################################

################################### DEFINITION OF THE MODULES ################################# 

##########################################################################################################
##########################################################################################################
##########################################################################################################

# Generate_Values_Membership_Form


sub Generate_Values_Membership_Form
 {
 
   
my $fuzzyterm  = shift;
    
my $prev_key   = 0;
    
my $prev_value = 0;
    
my $return     = initialize_fuzzyterm(0);
    
foreach my $key (sort {$a <=> $b} keys %$fuzzyterm) 
{
        my $value       = $fuzzyterm->{$key};
        
my $delta_key   = $key - $prev_key;
        
my $delta_value = $value - $prev_value;
        
if ($delta_key > 0) 
{
               $intervall = $delta_value / $delta_key;
            
		$value_new = $prev_value;
        
   for (my $i=$prev_key;$i<=$key; $i++) 
		{
     $return->{$i} = $value_new;
                
			$value_new += $intervall;
            
		}
       
 } 
else 
{
           
 $return->{$key} = $fuzzyterm->{$key};
     
   }
      

  $prev_key   = $key;
        
$prev_value = $value;
    }
    
return $return; 

}




##########################################################################################################



sub Transform_Step1_RANGE 
{ 
   
my $min       = shift;
    
my $max       = shift;
    
my $fuzzyterm = shift;
    
my $return;
    
foreach my $key (sort {$a <=> $b} keys %$fuzzyterm) 
{
        my $new_key = ScalingToTheRange($min,$max,$key);

        $return->{$new_key} = $fuzzyterm->{$key};
   
 }
    
return $return; 


}



# return a pointer  
 

########################################
sub Transform_Step2__RANGE 
{ 

   
my $min    = shift;
    
my $max    = shift;
    
my $value  = shift;
    
my $return;
    

$return = $min + (($max - $min) * $value / $range);

   print "The crisp new Value within the initial range  ($min,$max) is the following : ";
    
$return = min($return, $max);
    
$return = max($return, $min);

 print "$return\n";
   

 return $return;

}


##########################################################################################################




sub initialize_fuzzyterm
{ 
    
my $value = shift;
 
    
my $return;
    
for (my $i=0; $i<=$range; $i++) 
{
        $return->{$i} = $value;
    }
  
  return $return;

}

 
# returns a pointer
 


##########################################################################################################

use Switch;

sub Fuzzy_Aggregation_Step 
{ 

# operators to introduce ("AND","OR", "PROD")    

my $operator = shift;
    
my @args     = @_;
    
my $return;

  

switch ($operator)
{
case "AND" { $return = min(@args);
 return $return;

}
case "OR" {  $return = max(@args);
 return $return;

} 
case "PROD" { $return = multiply(@args);
 return $return;

} 
else { print "ERROR OPERATOR !!" } 
}


   }



####################################################################################################
sub multiply
{ 
  

my $return = shift;
 
my $val=1;

for (my $i = 0; $i<@_; $i++) 
{
 $val = $val * $_[$i];
 }
  
 $return = $val;
     
      
 return $return;


}




 #$max = &multiply (1,2,3);

#print "max = $max\n";


####################################################################################################



sub Fuzzy_Implication_Step

{ 

# method (MIN,PROD)    

my $operator    = shift;
    
my $fuzzyterm = shift;
    
my $value     = shift;
   
my $return;
    

switch ($operator)
{
case "MIN" { for (my $i=0; $i<=$range; $i++) 
         {
            if ($fuzzyterm->{$i} >= $value) 
                       {
                $return->{$i} = $value;
            } 


                      else 
                    {
         
                            $return->{$i} = $fuzzyterm->{$i};
           
                                                                    }
        
         }

 return $return;

}
case "PROD" {  for (my $i=0; $i<=$range; $i++) 
              {
            $return->{$i} = $fuzzyterm->{$i} * $value;
        
                        }
  
 return $return;

} 
  
else { print "ERROR OPERATOR !!" } 
}



 }

# RETURNS A Pointer to the result fuzzy term.

##########################################################################################################

sub Fuzzy_Accumulation_Step

{ 

# method ("MAX",   "SUM")  

my $operator = shift;
    
my $return = initialize_fuzzyterm(0);
 


switch ($operator)
{
case "MAX" { while (my $fuzzyterm = shift)
                  {
  for (my $i=0; $i<=$range; $i++) 
                               {
   $return->{$i} = min(1,max($return->{$i},$fuzzyterm->{$i},0));

		                   $return->{$i} = max($return->{$i},$fuzzyterm->{$i});
       
                               }
        
                   }
 return $return;

}
case "SUM" {  while (my $fuzzyterm = shift) 
                    {
 for (my $i=0; $i<=$range; $i++) 
                        {
                
                               $return->{$i} = max(0,min(1, $return->{$i}+$fuzzyterm->{$i}));
		
                               $return->{$i} = min(1, $return->{$i}+$fuzzyterm->{$i});
            
                         }
        
                     }
  
 return $return;

} 
  
else { print "ERROR OPERATOR !!" } 
}



}




##########################################################################################################

sub Fuzzy_Defuzzification_Step
{ 

# method ("CG")  : Center of Gravity  

my $operator       = shift;
    
my $fuzzyterm     = shift;
    
 
if ($operator eq "CG")

 {
        my $sum1 = 0;

        my $sum2 = 0;
       
 for (my $i=0; $i<=$range; $i++)
 {
            $sum1 += $fuzzyterm->{$i}*$i;

            $sum2 += $fuzzyterm->{$i};
        }
      
  if ($sum2 != 0)
 {
           
 $return = round($sum1/$sum2);
        } 
else {
           
 $return = round($range/2);
        }
   
 }

   
 return $return;

}



##########################################################################################################



sub round 
{
  
  $float = shift;
  
  $intgr = int($float + 0.5);
  
  return $intgr;

}

#$RoundNumber = &round(3.9);

#print "The rounded number is $RoundNumber\n";

##########################################################################################################



sub max 
{ 
  

my $return = shift;
 
my $val;

for (my $i = 0; $i<@_; $i++) 
{
 $val = $_[$i];
 
     if ($val > $return) 
{
            $return = $val;
     
   }
  
  }
   
 return $return;


}




 

 
##########################################################################################################

sub min 
{ 
 

 my $return = shift;

 my $val;
   
 for (my $i = 0; $i<@_; $i++) 
{
 $val = $_[$i];
 
   if ($val < $return) 
{
    $return = $val;
     
   }
   
 }
   

 return $return;


}

 

##########################################################################################################


sub ScalingToTheRange 
{ 

   
my $min    = shift;
    
my $max    = shift;
    
my $value  = shift;
   
my $return;
    

$return = round((min(max($value,$min),$max) - $min) * $range / ($max - $min));
    
return $return;

}

 
