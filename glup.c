/* ************************************************************************ *
 *    Glup, v0.01                                                           *
 *    Drinking game that consists in random commands to the players         *
 *                                                                          *
 *    Copyright (C) 2017 by Rafael Aziz Da Silva Rocha                      *
 *                                                                          *
 *    This program is free software; you can redistribute it and/or modify  *
 *    it under the terms of the GNU General Public License as published by  *
 *    the Free Software Foundation; either version 2 of the License, or     *
 *    (at your option) any later version.                                   *
 *                                                                          *
 *    This program is distributed in the hope that it will be useful,       *
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *    GNU General Public License for more details.                          *
 *                                                                          *
 *    You should have received a copy of the GNU General Public License     *
 *    along with this program; if not, write to the                         *
 *    Free Software Foundation, Inc.,                                       *
 *    59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             *
 *                                                                          *
 *    To contact the authors, please write to:                              *
 *    Rafael Aziz Da Silva Rocha <rafaelazizlvr@gmail.com>                  *
 *    Webpage: http://www.upe.br                                            *
 *    Phone: +55 (81) 99940-3183                                            *
 * ************************************************************************ *
 * 
 */
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <unistd.h>

#define MAX 500

int main(void)
{
    int k;
    int i;
	char j = ' ', c;
	char perg[101][MAX] = {0};
	FILE *com;
	com = fopen("commands.txt", "rt");

	for(i=0; i<=99; i++)
		fgets(perg[i], MAX, com);
	
	fclose(com);

    srand(time(NULL));
	while(1)
	{
		j = ' ';
		k =((rand() + getpid())%100);
    	printf("%s'n' to continue or 'q' to quit\n", perg[k]);
		scanf("%c", &j);
		while((c=getchar())!='\n' && c != EOF);
	    while(j != 'n')
	    {
			if(j == 'q')
    			return EXIT_SUCCESS;
			else 
			{
				printf("Invalid character, type again.\n");
				scanf("%c", &j);
				while((c=getchar())!='\n' && c != EOF);
			}
			usleep(16667);
		}
	}
}
