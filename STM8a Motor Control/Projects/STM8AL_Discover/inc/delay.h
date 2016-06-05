/**
  ******************************************************************************
  * @file    delay.h
  * @author  MCD Application Team
  * @version VX.Y.ZRCx
  * @date    DD-Month-YYYY
  * @brief   Header for appli.c module
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT YYYY STMicroelectronics</center></h2>
  *
  * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
  * You may not use this file except in compliance with the License.
  * You may obtain a copy of the License at:
  *
  *        http://www.st.com/software_license_agreement_liberty_v2
  *
  * Unless required by applicable law or agreed to in writing, software 
  * distributed under the License is distributed on an "AS IS" BASIS, 
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  *
  ******************************************************************************
  */

    /* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __DELAY_H
#define __DELAY_H

/* Includes ------------------------------------------------------------------*/
/* Exported types ------------------------------------------------------------*/
/* Exported constants --------------------------------------------------------*/
/* Exported macros -----------------------------------------------------------*/
/* Exported variables --------------------------------------------------------*/
/* Exported functions ------------------------------------------------------- */ 

void delay_ms(u16 n_ms) ;
void delay_10us(u16 n_10us);

#endif /* __DELAY_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
