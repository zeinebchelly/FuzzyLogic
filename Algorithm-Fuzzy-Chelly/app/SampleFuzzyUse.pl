#!/usr/bin/env perl

use strict;
use warnings;


=head1
 
 Defining the problem : 
 
 Given a number between 0 and 25 that represents the quality of service at a restaurant 
 (where 25 is excellent), and another number between 0 and 25 that represents the
 quality of the food at that restaurant (again, 25 is excellent), what should the tip be?

=cut


#****************************DEFINING THE RANGE : UNIVERSE OF DISCOURSE [0..25] For example **************


  my $min_range = 0;
  my $max_range = 25;

  my  $range = $max_range - $min_range;


##########################################################################################################
#*********************************************************************************************************
						#THE FUZZY PROCESS

##########################################################################################################
#**********************************************************************************************************

=head2					
                          	Input-Output Description 

  ---> In this sample, we will use 2 inputs and 1 output. Their names are as follows:
  input 1 =  $service
  input 2 = $food
  output =  $tip

=cut
##########################################################################################################

#Linguistic Variable for input 1 =  $service : Definied with 3 linguistic triangular membership functions (3 terms sets)
  my $service_poor; 
  $service_poor->{0} = 0;
  $service_poor->{5} = 1;
  $service_poor->{10} = 0;
  $service_poor = transform_step1_range($min_range,$max_range,$service_poor);
  $service_poor = generate_values_membership_form($service_poor);

 my  $service_medium;
  $service_medium->{5} = 0;
  $service_medium->{10} = 1;
  $service_medium->{15} = 0;
  $service_medium = transform_step1_range($min_range,$max_range,$service_medium);
  $service_medium = generate_values_membership_form($service_medium);

  my $service_excellent;
  $service_excellent->{6} = 0;
  $service_excellent->{17} = 1;
  $service_excellent->{25} = 0;
  $service_excellent = transform_step1_range($min_range,$max_range,$service_excellent);
  $service_excellent = generate_values_membership_form($service_excellent);

##########################################################################################################

#Linguistic Variable for input 2 = $food : Definied with 3 linguistic triangular membership functions (3 terms sets)

  my $food_rancid;
  $food_rancid->{0} = 0;
  $food_rancid->{5} = 1;
  $food_rancid->{10} = 0;
  $food_rancid = transform_step1_range($min_range,$max_range,$food_rancid);
  $food_rancid = generate_values_membership_form($food_rancid);

  my $food_medium;
  $food_medium->{5} = 0;
  $food_medium->{10} = 1;
  $food_medium->{15} = 0;
  $food_medium = transform_step1_range($min_range,$max_range,$food_medium);
  $food_medium = generate_values_membership_form($food_medium);

 
  my $food_delicious;
  $food_delicious->{6} = 0;
  $food_delicious->{17} = 1;
  $food_delicious->{25} = 0;
  $food_delicious = transform_step1_range($min_range,$max_range,$food_delicious);
  $food_delicious = generate_values_membership_form($food_delicious);

##########################################################################################################

#Linguistic Variable 3 (output 1) =  $tip  definied with 3 linguistic triangular membership functions (3 terms sets)

  my $tip_cheap;
  $tip_cheap->{0} = 0;
  $tip_cheap->{5} = 1;
  $tip_cheap->{10} = 0;
  $tip_cheap = transform_step1_range($min_range,$max_range,$tip_cheap);
  $tip_cheap = generate_values_membership_form($tip_cheap);

 my $tip_average;
 $tip_average->{5} = 0;
 $tip_average->{10} = 1;
 $tip_average->{15} = 0;
 $tip_average = transform_step1_range($min_range,$max_range,$tip_average);
 $tip_average = generate_values_membership_form($tip_average);

 my $tip_generous; 
 $tip_generous->{8} = 0;
 $tip_generous->{17} = 1;
 $tip_generous->{25} = 0;
 $tip_generous = transform_step1_range($min_range,$max_range,$tip_generous);
 $tip_generous = generate_values_membership_form($tip_generous);

##########################################################################################################

#**********************************************************************************************************
#*********************************************************************************************************

						#Input-Output Specification  

#**********************************************************************************************************
#*********************************************************************************************************

##########################################################################################################

############### Getting the values $Vble_1 and $Vble_2 in the specified $range   ##########################################

#Vbles to fuzzify $service & $food

my  $service = 7;
my  $food  = 9;

print " The Variables to fuzzify are:\n";

 $service = scaling_to_the_range($min_range,$max_range,$service);

print "  $service\n";

 $food = scaling_to_the_range($min_range,$max_range,$food);

print "  $food\n";


############### The Input's Membership Function Values : Fuzzification ###############################


 my $fuzzy_service_poor = $service_poor->{$service};
 print " fuzzy_service_poor = $fuzzy_service_poor\n";

my  $fuzzy_service_medium = $service_medium->{$service};
 print " Fuzzy_service_medium = $fuzzy_service_medium\n";
 
my  $fuzzy_service_excellent = $service_excellent->{$service};
 print " Fuzzy_service_excellent = $fuzzy_service_excellent\n";

my $fuzzy_food_rancid = $food_rancid->{$food};
 print " Fuzzy_food_rancid = $fuzzy_food_rancid\n";

my $fuzzy_food_medium = $food_medium->{$food};
 print " Fuzzy_food_medium = $fuzzy_food_medium\n";
 
my $fuzzy_food_delicious = $food_delicious->{$food};
 print " Fuzzy_food_delicious = $fuzzy_food_delicious\n";
 

###############   Apply Fuzzy Operator : Aggregation :   "AND" OPERATOR  ###############################
=head3
  
  --->Rules Description:

1 If the service is poor and the food is rancid, then tip is cheap.
2 If the service is poor and the food is medium, then tip is cheap.
3 If the service is poor and the food is delicious, then tip is average.

4 If the service is medium and the food is rancid, then tip is cheap.
5 If the service is medium and the food is medium, then tip is average.
6 If the service is medium and the food is delicious, then tip is average.

7 If the service is excellent and the food is rancid, then tip is average.
8 If the service is excellent and the food is medium, then tip is generous.
9 If the service is excellent and the food is delicious, then tip is generous.

=cut
#############################################################################################################

# Aggragation phase

# Define the operator for Aggregation : ("AND"  ,  "OR"  , "PROD") 

my $op_aggregation = "AND";
my $rule1 = fuzzy_aggregation_step($op_aggregation ,$fuzzy_service_poor,$fuzzy_food_rancid);
 print " rule1 = $rule1\n";
my $weight_rule1 = 1;

 $op_aggregation = "AND";
my $rule2 = fuzzy_aggregation_step($op_aggregation ,$fuzzy_service_poor,$fuzzy_food_medium);
 print " rule2 = $rule2\n";
my $weight_rule2 = 1;

 $op_aggregation = "AND";
my $rule3 = fuzzy_aggregation_step($op_aggregation ,$fuzzy_service_poor,$fuzzy_food_delicious);
 print " rule3 = $rule3\n";
my $weight_rule3 = 1;

 $op_aggregation = "AND";
my $rule4 = fuzzy_aggregation_step($op_aggregation ,$fuzzy_service_medium,$fuzzy_food_rancid);
 print " rule4 = $rule4\n";
my $weight_rule4 = 1;

 $op_aggregation = "AND";
my $rule5 = fuzzy_aggregation_step($op_aggregation ,$fuzzy_service_medium,$fuzzy_food_medium);
 print " rule5 = $rule5\n";
my $weight_rule5 = 1;

 $op_aggregation = "AND";
my $rule6 = fuzzy_aggregation_step($op_aggregation ,$fuzzy_service_medium,$fuzzy_food_delicious);
 print " rule6 = $rule6\n";
my $weight_rule6 = 1;

 $op_aggregation = "AND";
my $rule7 = fuzzy_aggregation_step($op_aggregation ,$fuzzy_service_excellent,$fuzzy_food_rancid);
 print " rule7 = $rule7\n";
my $weight_rule7 = 1;

 $op_aggregation = "AND";
my $rule8 = fuzzy_aggregation_step($op_aggregation ,$fuzzy_service_excellent,$fuzzy_food_medium);
 print " rule8 = $rule8\n";
my $weight_rule8 = 1; 

 $op_aggregation = "AND";
my $rule9 = fuzzy_aggregation_step($op_aggregation ,$fuzzy_service_excellent,$fuzzy_food_delicious);
 print " rule9 = $rule9\n";
my $weight_rule9 = 1;

###############  IMPLICATION  :   "OR" OPERATOR  ###############################

# Define the operator for Implication : ("MIN" , "PROD")

my $op_implication = "MIN";

# Implication phase

my $rule1_result_fuzzyset = fuzzy_implication_step($op_implication, $tip_cheap, ($weight_rule1 * $rule1));

my $rule2_result_fuzzyset = fuzzy_implication_step($op_implication, $tip_cheap, ($weight_rule2 * $rule2));

my $rule3_result_fuzzyset = fuzzy_implication_step($op_implication, $tip_average, ($weight_rule3 * $rule3));

my $rule4_result_fuzzyset = fuzzy_implication_step($op_implication, $tip_cheap, ($weight_rule4 * $rule4));

my $rule5_result_fuzzyset = fuzzy_implication_step($op_implication, $tip_average, ($weight_rule5 * $rule5));

my $rule6_result_fuzzyset = fuzzy_implication_step($op_implication, $tip_average, ($weight_rule6 * $rule6));

my $rule7_result_fuzzyset = fuzzy_implication_step($op_implication, $tip_average, ($weight_rule7 * $rule7));

my $rule8_result_fuzzyset = fuzzy_implication_step($op_implication, $tip_generous, ($weight_rule8 * $rule8));

my $rule9_result_fuzzyset = fuzzy_implication_step($op_implication, $tip_generous, ($weight_rule9 * $rule9)); 

###############  Accumulation  : Aggregate All Outputs ###############################

# Define the operator for  Accumulation : ("MAX" , "SUM")

my $op_accumulation = "MAX";

#  Accumulation phase

my $tip_result_fuzzyset = initialize_fuzzyterm(0);

  $tip_result_fuzzyset = fuzzy_accumulation_step($op_accumulation,$tip_result_fuzzyset,$rule1_result_fuzzyset);

  $tip_result_fuzzyset = fuzzy_accumulation_step($op_accumulation,$tip_result_fuzzyset,$rule2_result_fuzzyset);

  $tip_result_fuzzyset = fuzzy_accumulation_step($op_accumulation,$tip_result_fuzzyset,$rule3_result_fuzzyset);

  $tip_result_fuzzyset = fuzzy_accumulation_step($op_accumulation,$tip_result_fuzzyset,$rule4_result_fuzzyset);

  $tip_result_fuzzyset = fuzzy_accumulation_step($op_accumulation,$tip_result_fuzzyset,$rule5_result_fuzzyset);

  $tip_result_fuzzyset = fuzzy_accumulation_step($op_accumulation,$tip_result_fuzzyset,$rule6_result_fuzzyset);

  $tip_result_fuzzyset = fuzzy_accumulation_step($op_accumulation,$tip_result_fuzzyset,$rule7_result_fuzzyset);

  $tip_result_fuzzyset = fuzzy_accumulation_step($op_accumulation,$tip_result_fuzzyset,$rule8_result_fuzzyset);

 $tip_result_fuzzyset = fuzzy_accumulation_step($op_accumulation,$tip_result_fuzzyset,$rule9_result_fuzzyset);

###############  Defuzzification  ###############################

# Define the operator for  Defuzzification : ("CG")

my $op_defuzzification = "CG";

#  Defuzzification phase

my $tip_result_crisp = fuzzy_defuzzification_step($op_defuzzification, $tip_result_fuzzyset);

 print " tip_result_crisp = $tip_result_crisp\n";

my $tip = transform_step2__range($min_range, $max_range, $tip_result_crisp);

##########################################################################################################
##########################################################################################################
##########################################################################################################

################################### DEFINITION OF THE MODULES ################################# 

##########################################################################################################
##########################################################################################################
##########################################################################################################

# Generate_Values_Membership_Form


sub generate_values_membership_form
 {
 
   
my $fuzzyterm  = shift;
    
my $prev_key   = 0;
    
my $prev_value = 0;
my $intervall;
my $value_new;
    
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



sub transform_step1_range
{ 
   
my $min       = shift;
    
my $max       = shift;
    
my $fuzzyterm = shift;
    
my $return;
    
foreach my $key (sort {$a <=> $b} keys %$fuzzyterm) 
{
        my $new_key = scaling_to_the_range($min,$max,$key);

        $return->{$new_key} = $fuzzyterm->{$key};
   
 }
    
return $return; 


}



# returns a pointer  
 

########################################
sub transform_step2__range 
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

sub fuzzy_aggregation_step 
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



sub fuzzy_implication_step

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

sub fuzzy_accumulation_step

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

sub fuzzy_defuzzification_step
{ 

# method ("CG")  : Center of Gravity  

my $operator       = shift;
    
my $fuzzyterm     = shift;
   
my $return;
 
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
  
  my $float = shift;
  
  my $intgr = int($float + 0.5);
  
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


sub scaling_to_the_range 
{ 

   
my $min    = shift;
    
my $max    = shift;
    
my $value  = shift;
   
my $return = round((min(max($value,$min),$max) - $min) * $range / ($max - $min));
    
return $return;

}

 
